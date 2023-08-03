#region Splatter [ 0.5.5 ] : Simple Scripts to Supercharge Splatting (Install-Module Splatter, then Initialize-Splatter -Verb Get,Use,Find,Merge )

[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "", Justification="This Declares Variables for Other Scripts")]
param()
${?@}=${GetSplat}=${gSplat}={
    <#
    .Synopsis
        Gets a splat
    .Description
        Gets a splat for a command
    .Link
        Find-Splat
    .Link
        Use-Splat
    .Example
        @{id=$pid} | Get-Splat
    .Example
        @{id=$Pid} | ?@ # ?@ is an alias for Get-Splat
    .Example
        @{id=$pid} | & ${?@} # Get-Splat as a script block
    #>
    [Alias('?@','gSplat')]
    param(
    # The command that is being splatted.
    [Parameter(Mandatory=$true,Position=0)]
    [PSObject[]]
    $Command,

    # The input object
    [Parameter(Mandatory=$true,ValueFromPipeline=$true,Position=1)]
    [Alias('InputObject')]
    [PSObject]
    $Splat,

    # If set, will return regardless of if parameters map,  are valid, and have enough mandatory parameters
    [switch]
    $Force
    )
    begin {
        # Declare some caches:
        if (-not ${script:_@p}) { ${script:_@p} = @{} } # * All Parameters
        if (-not ${script:_@c}) { ${script:_@c} = @{} } # * All commands
        if (-not ${script:_@mp}) { ${script:_@mp} = @{} } # * All Mandatory Parameters
        if (-not ${script:_@pp}) { ${script:_@pp} = @{} } # * All Pipelined Parameters
        $ValidateAttributes = {
            param(
                [Parameter(Mandatory)]$value,
                [Parameter(Mandatory)]$attributes
            )

            foreach ($attr in $attributes) {
                $_ = $this = $value
                if ($attr -is [Management.Automation.ValidateScriptAttribute]) {
                    $result = . $attr.ScriptBlock
                    if ($result -ne $true) {
                        $attr
                    }
                }
                elseif ($attr -is [Management.Automation.ValidatePatternAttribute] -and
                        (-not [Regex]::new($attr.RegexPattern, $attr.Options, '00:00:05').IsMatch($value))
                    ) { $attr }
                elseif ($attr -is [Management.Automation.ValidateSetAttribute] -and
                        $attr.ValidValues -notcontains $value) { $attr }
                elseif ($attr -is [Management.Automation.ValidateRangeAttribute] -and (
                    ($value -gt $attr.MaxRange) -or ($value -lt $attr.MinRange)
                )) {$attr}
            }
        }
    }
    process {

        $ap,$ac,$amp = ${script:_@p},${script:_@c}, ${script:_@mp}
        #region Turn dictionaries into PSObjects
        if ($Splat -is [Collections.IDictionary]) {
            $splat = [PSCustomObject]([Ordered]@{} +  $Splat)
        }
        #endregion Turn dictionaries into PSObjects

        $in = $Splat
        foreach ($cmd in $Command) { # Walk over each command
            $rc =
                if ($ac.$cmd) { # use cache if available, otherwise:
                    $ac.$cmd
                } elseif ($cmd -is [string]) { # *find it if it's a [string]
                    $fc = $ExecutionContext.SessionState.InvokeCommand.GetCommand($cmd,'Function,Cmdlet,ExternalScript,Alias')
                    $fc =
                        if ($fc -is [Management.Automation.AliasInfo]) {
                            $fc.ResolvedCommand
                        } else {
                            $fc
                        }
                    $ac.$cmd = $fc
                    $fc
                } elseif ($cmd -is [ScriptBlock]) { # * Make a temporary command if it's a [ScriptBlock]
                    $hc = $cmd.GetHashCode()
                    $ExecutionContext.SessionState.PSVariable.Set("function:f$hc", $cmd)
                    $c = $ExecutionContext.SessionState.InvokeCommand.GetCommand("f$hc",'Function')
                    $ac.$cmd = $c
                    $c
                } elseif ($cmd -is [Management.Automation.CommandInfo]) { # * Otherwise, use the command info
                    $ac.$cmd = $cmd
                    $cmd
                }
            if (-not $rc) {continue}
            $cmd = $rc
            $outSplat,$Invalid,$Unmapped,$paramMap,$Pipe,$NoPipe = foreach ($_ in 1..6){[ordered]@{}}
            $params = [Collections.ArrayList]::new()
            $props = @($in.psobject.properties)
            $pc = $props.Count

            if (-not ${script:_@pp}.$cmd) {
                ${script:_@pp}.$cmd = @(
                foreach ($param in $cmd.Parameters.Values) {
                    foreach ($attr in $param.Attributes) {
                        if ($attr.ValueFromPipeline) {
                            $param
                        }
                    }
                })
            }

            $cmdMd = $cmd -as [Management.Automation.CommandMetaData]
            $problems = @(

            foreach ($vfp in ${script:_@pp}.$cmd) {
                if ($in -is $vfp.ParameterType -or
                    ($vfp.ParameterType.IsArray -and $in -as $vfp.ParameterType)
                ) {
                    $v = $in
                    $badAttributes = & $ValidateAttributes $v $vfp.Attributes
                    if ($badAttributes) {
                        @{$vfp.Name=$badAttributes}
                    }
                    if (-not $badAttributes -or $Force) {
                        $null = $params.Add($vfp.Name)
                        $pipe[$vfp.Name] = $v
                        $outSplat[$vfp.Name] = $v
                        $paramMap[$vfp.Name] = $vfp.Name
                        $pipelineParameterSets =
                            @(foreach ($attr in $vfp.Attributes) {
                                if ($attr.ParameterSetName) { $attr.ParameterSetName}
                            })
                    }
                }
            }

            :NextProperty foreach ($prop in $props) {
                $cp=$cmd.Parameters
                $pn = $prop.Name
                $pv = $prop.Value
                if (-not $cp) { continue }
                $param = $cp.$pn
                if (-not $param) {
                    $k = "${cmd}:$pn"
                    $param =
                        if ($ap[$k]) {
                            $ap[$k]
                        } else {
                            foreach ($p in $cp.Values) {
                                foreach ($a in $p.Aliases) {
                                    $ap["${cmd}:$a"] = $p
                                }
                                if ($ap[$k]) { $ap[$k]; break }
                            }
                        }
                }

                if (-not $param) {
                    $pn
                    continue
                }
                $paramMap[$param.Name] = $pn
                if ($params -contains $param) { continue }
                $pt=$param.ParameterType
                $paramSets =
                    @(foreach ($attr in $param.Attributes) {
                        if ($attr.ParameterSetName) { $attr.ParameterSetName }
                    })

                if ($pipelineParameterSets) {
                    $ok = $false
                    foreach ($cmdPs in $paramSets) {
                        $ok = $ok -bor ($pipelineParameterSets -contains $cmdPs)
                    }
                    if (-not $ok -and -not $Force) { continue }
                }
                $v = $pv -as $pt
                if (-not $v -and
                    ($pt -eq [ScriptBlock] -or
                    $pt -eq [ScriptBlock[]])) {
                    $sb = try { foreach ($_ in $pv) { [ScriptBlock]::Create($_) }} catch {$null}
                    if ($sb) { $v = $sb }
                }
                if ($null -ne $v) {
                    $nv = try {
                        [PSVariable]::new("$pn", $v, 'Private',$param.Attributes)
                    } catch {
                        @{$pn=$_}
                    }
                    if ($nv -is [PSVariable] -or $Force) {
                        $null = $params.Add($param)
                        :CanItPipe do {
                            foreach ($attr in $param.Attributes) {
                                if ($attr.ValueFromPipeline -or $attr.ValueFromPipelineByPropertyName -and
                                    ((-not $pipelineParameterSets) -or ($pipelineParameterSets -contains $attr.ParameterSetName))
                                ) {
                                    $pipe[$prop.Name] = $v
                                    break CanItPipe
                                }
                            }
                            $NoPipe[$prop.Name] = $v
                        } while ($false)
                        $outSplat[$prop.Name] = $v
                    }

                    if ($nv -isnot [PSVariable]) { $nv }
                } else {
                    @{$pn = $param}
                }
            })


            $Mandatory = @{}

            foreach ($param in $cmdMd.Parameters.Values) {
                foreach ($a in $param.Attributes) {
                    if (-not $a.Mandatory) { continue }
                    if ($a -isnot [Management.Automation.ParameterAttribute]) { continue }
                    if (-not $Mandatory[$a.ParameterSetName]) { $Mandatory[$a.ParameterSetName] = [Ordered]@{} }
                    $mp = ($paramMap.($param.Name))
                    $Mandatory[$a.ParameterSetName].($param.Name) =
                        if ($mp) {
                            if ($pipelineParameterName -contains $param.Name) {
                                $in
                            } else {
                                $outSplat.$mp
                            }
                        }
                }
            }
            $amp.$cmd = $Mandatory

            $mandatory = $amp.$cmd

            $missingMandatory = @{}
            foreach ($m in $Mandatory.GetEnumerator()) {
                $missingMandatory[$m.Key] =
                    @(foreach ($_ in $m.value.GetEnumerator()) {
                        if ($null -eq $_.Value) { $_.Key }
                    })
            }
            $couldRun =
                if (-not $Mandatory.Count) { $true }
                elseif ($missingMandatory.'__AllParameterSets') {
                    $false
                }
                else {
                    foreach ($_ in $missingMandatory.GetEnumerator()) {
                        if (-not $_.Value) { $true;break }
                    }
                }

            if (-not $couldRun -and -not $Force) { continue }
            foreach ($p in $problems) {
                if ($p -is [Hashtable]) {
                    $Invalid += $p
                } else { $Unmapped[$p] = $in.$p }
            }
            if ($Invalid.Count -eq 0) { $Invalid = $null }
            if ($Unmapped.Count -eq 0) { $Unmapped = $null }

            $realCmd =
                if ($cmd -is [Management.Automation.FunctionInfo] -and
                    $cmd.Name.Contains($cmd.ScriptBlock.GetHashCode().ToString())) {
                    $cmd.ScriptBlock
                } else { $cmd }

            foreach($_ in ([Ordered]@{
                Command = $realCmd
                CouldRun = $couldRun
                Invalid = $Invalid
                Missing = $missingMandatory
                PercentFit = $(if ($pc) {$outSplat.Count / $pc } else { 0})
                Unmapped = $Unmapped
                PipelineParameter = $Pipe
                NonPipelineParameter = $NoPipe
            }).GetEnumerator()) {
                $outSplat.psobject.properties.Add([Management.Automation.PSNoteProperty]::new($_.Key,$_.Value))
            }
            $outSplat
        }
    }
}
${.@}=${UseSplat}={
    <#
    .Synopsis
        Uses a splat.
    .Description
        Uses a splat to call a command.
        If passed from Find-Splat,Get-Splat or Test-Splat, the command will be automatically detected.
        If called as .@, this will run only provided commands
        If called as *@, this will run any found commands
    .Link
        Get-Splat
    .Link
        Find-Splat
    .Link
        Test-Splat
    .Example
        @{id=$pid} | Use-Splat gps # When calling Use-Splat is globally imported
    .Example
        @{id=$pid} | & ${.@} gps # When calling Use-Splat is nested
    .Example
        @{LogName='System';InstanceId=43,44},
        @{LogName='Application';InstanceId=10000,10005} |
            .@ Get-EventLog # get a bunch of different log events
    #>
    [Alias('.@','uSplat')]
    param(
    # One or more commands
    [Parameter(Position=0)]
    [PSObject[]]
    $Command,

    # Any additional positional arguments that would be passed to the command
    [Parameter(Position=1,ValueFromRemainingArguments)]
    [PSObject[]]
    $ArgumentList = @(),

    # The splat
    [Parameter(ValueFromPipeline=$true)]
    [PSObject[]]
    $Splat,

    # If set, will run regardless of if parameters map, are valid, and have enough mandatory parameters.
    [switch]
    $Force,

    # If set, will run the best fit out of multiple commands.
    # The best fit is the command that will use the most of the input splat.
    [Alias('BestFit','BestFitFunction', 'BF','BFF')]
    [switch]
    $Best,

    # If set, will stream input into a single pipeline of each command.
    # The non-pipeable parameters of the first input splat will be used to start the pipeline.
    # By default, a command will be run once per input splat.
    [Alias('Pipe')]
    [switch]
    $Stream)

    begin {
        $pipelines = @{}        
    }
    process {
        $WeTrustTheSplat = $false
        if (-not $Command -and
            $splat.Length -eq 1 -and
            $splat[0] -is [Collections.IDictionary] -and
            $Splat[0].psobject.Properties['Command']) {
            $Command = $Splat[0].psobject.Properties['Command'].Value
            $WeTrustTheSplat = $true
        } elseif (-not $command -and $_ -is [PSObject] -and $_.Command -and $_.Splat) {
            $WeTrustTheSplat = $true
            $splat = $_.Splat
            $command = $_.Command
        }

        if ($Best -and $command.Count) {
            $command = $splat |
                & ${?@} -Command $command |
                Sort-Object PercentFit -Descending |
                Select-Object -ExpandProperty Command -First 1
        }

        if (-not $Command) {
            Write-Error -Message "No command found" -Category ObjectNotFound -ErrorId 'Use-Splat.CommandNotFound' ;return
        }
        #region UseTheSplat
        foreach ($cmd in $Command) {
            if ($WeTrustTheSplat) {
                if ($cmd -is [Management.Automation.CommandInfo] -or $cmd -is [ScriptBlock]) {
                    foreach ($s in $splat) {
                        if ($argumentList) {
                            & $cmd @s @ArgumentList
                        } else {
                            & $cmd @s
                        }
                    }
                }
            } else {
                $Splat |
                    & ${?@} $cmd -Force:$Force |
                    & { process {

                        $i = $_
                        $np = $i.NonPipelineParameter
                        $c = $_.psobject.properties['Command'].Value
                        if ($Stream) {
                            if (-not $pipelines[$c]) {

                                $stepScript = if ($argumentList) { {& $c @np @argumentList} } else { {& $c @np} }

                                $stepPipeline = $stepScript.GetSteppablePipeline()
                                $pipelines[$c] = $stepPipeline
                                $stepPipeline.Begin($true)
                            } else {
                                $stepPipeline = $pipelines[$c]
                            }
                            $stepPipeline.Process([PSCustomObject]$i.PipelineParameter)
                            return
                        }

                        if ($c -is [Management.Automation.CommandInfo] -or $c -is [ScriptBlock]) {
                            if ($ArgumentList) {
                                & $c @i @ArgumentList
                            } else {
                                & $c @i
                            }
                        }
                    }}
            }
        }
        #endregion UseTheSplat
    }

    end {
        if ($pipelines.Count) {
            foreach ($v in $pipelines.Values) { $v.End() }
        }
    }
}
${??@}=${FindSplat}=${fSplat}={
    <#
    .Synopsis
        Finds commands that can be splatted to given an input.
    .Description
        Finds the commands whose input parameters match an input object, and returns an [ordered] dictionary of parameters.
    .Link
        Get-Splat
    .Link
        Use-Splat
    .Example
        @{Id=$pid} | Find-Splat -Global
    #>
    [Alias('??@','fSplat')]
    param(
    # One or more commands.
    # If not provided, commands from the current module will be searched.
    # If there is no current module, all commands will be searched.
    [Parameter(Position=0)]
    [string[]]$Command,

    # The splat
    [Parameter(ValueFromPipeline=$true,Position=1)]
    [Alias('InputObject')]
    [PSObject]$Splat,

    # If set, will look for all commands, even if Find-Splat is used within a module.
    [Alias('G')][switch]$Global,

    # If set, will look for commands within the current module.
    # To make this work within your own module Install-Splat.
    [Alias('L')][switch]$Local,

    # If provided, will look for commands within any number of loaded modules.
    [Alias('M')][string[]]$Module,

    # If set, will return regardless of if parameters map,  are valid, and have enough mandatory parameters
    [switch]$Force)
    begin {
        $myModule = $MyInvocation.MyCommand.ScriptBlock.Module
        $cmdTypes = 'Function,Cmdlet,ExternalScript,Alias'
        $resolveAliases = { begin {
            $n = 0
        } process {
            $n++
            if ($t -is [int] -and $id) {
                $p = $n* 100 / $t
                Write-Progress "Resolving" "$_ " -PercentComplete $p -Id $id
            }
            if ($_.ResolvedCommand) { $_.ResolvedCommand }
            else { $_ }
        } end {
            Write-Progress 'Resolving Aliases' 'Complete' -Id $id
        } }
        $filterCmds = { process {
            foreach ($c in $Command) { if ($_ -like $c) { return $_ } }
        } }
    }
    process {
        if (-not $Splat) { return }
        $id =[Random]::new().Next()

        $commandList =
            @(if (-not $Command) {
                Write-Progress -Id $id -Activity 'Getting Commands' -Status ' '
                if ($MyModule -and $Local) {
                    $myModule.ExportedCommands.Values | . $resolveAliases | Select-Object -Unique
                } elseif ($module) {
                    foreach ($m in $Module) {
                        $rm = Get-Module $m
                        if (-not $rm) { continue }
                        $rm.ExportedCommands.Values | . $resolveAliases | Select-Object -Unique
                    }
                } else {
                    $allcmds = @($ExecutionContext.SessionState.InvokeCommand.GetCommands('*',$cmdTypes, $true))
                    $t = $allcmds.Count
                    $allcmds |. $resolveAliases | Select-Object -Unique
                }
            } elseif ($module) {
                foreach ($m in $Module) {
                    $rm = Get-Module $m
                    if (-not $rm) { continue }
                    $rm.ExportedCommands.Values |
                        . $resolveAliases | . $filterCmds |
                        Select-Object -Unique
                }
            } elseif ($Global) {
                foreach ($c in $Command) {
                    $ExecutionContext.SessionState.InvokeCommand.GetCommands($c,$cmdTypes, $true)
                }
            } elseif ($MyModule -and $Local) {
                $myModule.ExportedCommands.Values |
                        . $filterCmds | . $resolveAliases | Select-Object -Unique
            } else {
                foreach ($cmd in $Command) {
                    if ($cmd -is [string] -and $cmd.Contains('*')) {
                        $ExecutionContext.SessionState.InvokeCommand.GetCommands($cmd,$cmdTypes, $true)
                    } else {
                        $cmd
                    }
                }
            })
        $psBoundParameters.Command = $commandList
        if ($Splat -is [Collections.IDictionary]) {
            $Splat =
                if ($splat.GetType().Name -ne 'PSBoundParametersDictionary') {
                    [PSCustomObject]$Splat
                } else {
                    [PSCustomObject]([Ordered]@{} +  $Splat)
                }
        }

        $c,$t=  0, $commandList.Count
        foreach ($cmd in $commandList) {
            if ($t -gt 1) {
                $c++;$p=$c*100/$t
                Write-Progress -Id $id -Activity 'Finding Splats' -Status "$cmd " -PercentComplete $p
            }
            $Splat |
                & ${?@} $cmd -Force:$Force |
                Select-Object -Property * -ExcludeProperty SyncRoot,IsSynchronized,IsReadOnly,IsFixedSize,Count |
                & { process {
                    if ($_.PercentFit -eq 0) { return }
                    $_.pstypenames.clear()
                    $_.pstypenames.add('Find.Splat.Output')
                    $keys, $values = @($_.Keys), @($_.Values)
                    $resplat = [Ordered]@{}
                    for ($i=0;$i -lt $keys.count;$i++) {
                        $resplat[$keys[$i]] = $values[$i]
                    }
                    $_.psobject.properties.remove('Keys')
                    $_.psobject.properties.remove('Values')
                    $_.psobject.properties.Add([Management.Automation.PSNoteProperty]::new('Splat', $resplat))
                    $_
                } }
        }

        Write-Progress -Id $id -Completed -Activity 'Finding Splats' -Status 'Complete!'
    }
}
${*@}=${MergeSplat}=${mSplat}={
    <#
    .Synopsis
        Merges one or more splats
    .Description
        Merges one or more hashtables and property bags into one [ordered] hashtable.
        Allows you to -Remove specific keys from any object
        Allows you to -Include or -Exclude wildcards of keys (or patterns, with -RegularExpression)
        Allows you to -Map additional values if a value if found.
    .Link
        Get-Splat
    .Link
        Use-Splat
    .Example
        @{a='b'}, @{c='d'} | Merge-Splat
    .Example
        [PSCustomOBject]@{a='b'}, @{c='d'} | Merge-Splat -Add @{e='f'} -Remove c
    .Example
        @{id=$pid} |
            Use-Splat Get-Process |
            Merge-Splat -Include Name
    .Example
        @{n=$(Get-Random) } |
            Merge-Splat -Map @{
                N = {
                    if (-not ($_ % 2)) { @{IsEven=$true;IsOdd=$false} }
                    else { @{IsEven=$false;IsOdd=$true}}
                }
            }
    #>
    [Alias('*@','mSplat')]
    param(
    # The splat
    [Parameter(ValueFromPipeline)]
    [Alias('InputObject')]
    [PSObject[]]
    $Splat,

    # Splats or objects that will be added to the splat.
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [Alias('With', 'W', 'A', '+')]
    [PSObject[]]
    $Add,

    # The names of the keys to remove from the splat
    [Alias('Delete','Drop', 'D','R', '-')]
    [string[]]
    $Remove,

    # Patterns of names to include in the splat.
    # If provided, only keys that match at least one -Include pattern will be kept.
    # By default, these are wildcards, unlesss -RegularExpression is passed.
    [Alias('E', 'EX')]
    [string[]]
    $Include,

    # Patterns of names to exclude from the splat.
    # By default, these are wildcards, unlesss -RegularExpression is passed.
    [Alias('I', 'IN')]
    [string[]]
    $Exclude,

    # If set, all patterns matched will be assumed to be RegularExpressions, not wildcards
    [Alias('Regex','RX')]
    [switch]
    $RegularExpression,

    # A map of new data to add.  The key is the name of the original property.
    # The value can be any a string, a hashtable, or a script block.
    # If the value is a string, it will be treated as a key, and the original property will be copied to this key.
    # If the value is a hashtable, it will add the values contained in Map.
    # If the value is a ScriptBlock, it will combine the output of this script block with the splat.
    [Alias('M','ReMap')]
    [Collections.IDictionary]
    $Map,

    # If set, will keep existing values in a splat instead of adding it to a list of values.
    [switch]
    $Keep,

    # If set, will replace existing values in a splat instead of adding it to a list of values.
    [switch]
    $Replace)


    begin {
        $accumulate = [Collections.ArrayList]::new()
        $aSplat = {param($o, $i)
            if ($i -is [Collections.IDictionary]) {
                try { $o += $i }
                catch {
                    foreach ($kv in $i.GetEnumerator()) {
                        $gotIt? = $o.Contains($kv.Key)
                        if ($gotIt? -and $Keep) { continue }
                        if ($gotIt? -and $Replace) {
                            $o[$kv.Key] = $kv.Value;continue
                        } elseif ($gotIt?) {
                            if ($o[$kv.Key] -isnot [Object[]]) {
                                $o[$kv.Key] = @($o[$kv.Key])
                            }
                            $o[$kv.Key] += $kv.Value
                        } else {
                            $o[$kv.Key] = $kv.Value
                        }
                    }

                }
            } else {
                foreach ($prop in $i.psobject.properties) { $o[$prop.Name] = $prop.Value }
            }
        }
        $imSplat = {
            if (-not $accumulate.Count) { return }
            $o = [Ordered]@{}
            foreach ($in in $accumulate) {
                . $aSplat $o $in
            }
            $ok = @($o.Keys)
            :nextKey foreach ($k in $ok) {
                if ($Map -and $map.$k) {
                    foreach ($mk in $map.$k) {
                        if ($mk -is [string]) { $o[$mk] = $o[$k] }
                        elseif ($mk -is [Collections.IDictionary]) {
                            . $aSplat $o $mk
                        }
                        elseif ($mk -is [ScriptBlock]) {
                            $_ = $o[$k]
                            $mkr = . $mk $_
                            foreach ($r in $mkr) { . $aSplat $o $r }
                        }
                    }
                }

                if ($Exclude) {
                    foreach ($ex in $Exclude) {
                        if (($RegularExpression -and ($k -match $ex)) -or
                            ($k -like $ex)) {
                            $o.Remove($k)
                            continue nextKey
                        }
                    }
                }

                if ($include) {
                    foreach ($in in $include) {
                        if (($RegularExpression -and ($k -match $in)) -or
                            ($k -like $in)) {
                            continue nextKey
                        }
                    }
                    $o.Remove($k)
                }
            }
            foreach ($r in $Remove) { $o.Remove($r) }
            $accumulate.Clear()
            $o
        }
    }
    process {
        $isTheEndOfTheLine =
            $MyInvocation.PipelinePosition -eq $MyInvocation.PipelineLength
        if ($Splat) { $accumulate.AddRange($Splat) }
        if ($Add) { $accumulate.AddRange($add) }
        if (-not $isTheEndOfTheLine) {
            . $imSplat
        }
    }

    end {
        . $imSplat
    }
}
#endregion Splatter [ 0.5.5 ] : Simple Scripts to Supercharge Splatting (Install-Module Splatter, then Initialize-Splatter -Verb Get,Use,Find,Merge )
