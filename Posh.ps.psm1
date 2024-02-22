# We start by loading our format and types files
Update-FormatData -PrependPath (Join-Path $PSScriptRoot "Posh.format.ps1xml")
Update-TypeData -AppendPath (Join-Path $PSScriptRoot "Posh.types.ps1xml")

# Next, we decorate several global variables.
# None of these automatically have formatting or extended types, so we can improve their experiences.

# For instance, we can help search thru errors just by extending the object
[decorate('Posh.Errors',Clear)]$global:error
# we could also make $executionContext easier to understand (hopefully)
[decorate('Posh.ExecutionContext',Clear)]$global:ExecutionContext
# we can make the host information present more cleanly, 
# and prevent people from digging into deep properties.
[decorate('Posh.Host',Clear)]$global:Host
# (of course, we can also make the deeper parts of hosting easier, too)
$hostUI = $global:Host.UI
[decorate('Posh.Host.UI',Clear)]$hostUI
$hostRawUI = $hostUI.RawUI
[decorate('Posh.Host.RawUI',Clear)]$hostRawUI
# And we can manipulate the profile
[decorate('Posh.Profiles',Clear)]$global:PROFILE

# If $psStyle is present, we want to tweak it _just_ a little
if ($global:PSStyle) {
    # Specifically, we want to add information to FileInfo
    # A Collection of Patterns (in case extensions alone aren't enough)   
    $global:PSStyle.FileInfo | Add-Member NoteProperty Pattern ([Ordered]@{}) -Force
    
    # A set of extension icons.
    $global:PSStyle.FileInfo | Add-Member NoteProperty ExtensionIcon ([Ordered]@{}) -Force

    # These pieces of information will be used later in our File Table View.
}

. (Join-Path $PSScriptRoot '@.ps1')

# The next neat trick we do is decorate ourselves.
$Posh = $MyModule = $MyInvocation.MyCommand.ScriptBlock.Module
$Posh.pstypenames.Insert(0,'Posh')

#region Stackable Functions
$stackableFunctions = [Ordered]@{
    Prompt = 'prompt'
    Input  = 'PSConsoleHostReadLine'
    TabExpansion = 'TabExpansion2'
}

foreach ($stackableFunctionKeyValue in $stackableFunctions.GetEnumerator()) {
    $functionStackType = $stackableFunctionKeyValue.Key
    $stackableFunction = 
        [PSCustomObject]@{
            PSTypeName = "Posh.$functionStackType"
            Stack = [Collections.Stack]::new()
            FunctionName = $stackableFunctionKeyValue.Value
        }
    $posh |
        Add-Member NoteProperty $functionStackType $stackableFunction -Force
}
#endregion Stackable Functions

#region $Posh.Parameters

# Add a Posh.Parameters psuedo object to $Posh.
$Posh |
    Add-Member NoteProperty Parameters (
        [PSCustomObject]@{
            PSTypeName    = "Posh.Parameters"
            DefaultValues = $global:PSDefaultParameterValues
        }
    ) -Force

# Add $LastOutput
$Posh.Parameters.Defaults = "Out-Default", "OutVariable", "LastOutput"
$Posh.Parameters.Defaults = "Out-Default", "ErrorVariable", "LastOutputError"
#endregion $Posh.Parameters


$poshCommands = 
    # Neat tricks, explained:
    # In this object, we will get an enumerable to get each type of command.
    # Thus we can enumerate it quickly and as many times as we want. 
    [PSCustomObject][Ordered]@{
        PSTypeName = 'Posh.Commands'
        All = $global:ExecutionContext.InvokeCommand.GetCommands('*','All',$true)
        Application = $global:ExecutionContext.InvokeCommand.GetCommands('*','Application',$true)
        Function = $global:ExecutionContext.InvokeCommand.GetCommands('*','Function',$true)
        Alias = $global:ExecutionContext.InvokeCommand.GetCommands('*','Alias',$true)
        Cmdlet = $global:ExecutionContext.InvokeCommand.GetCommands('*','Cmdlet',$true)        
    }

$posh | Add-Member NoteProperty Commands $poshCommands -Force

$exportedVariables = @('posh')

$hasModuleProfiles = $posh.ModuleProfiles
if ($hasModuleProfiles) {
    foreach ($moduleProfile in $hasModuleProfiles) {
        . $moduleProfile
    }
}

Export-ModuleMember -Variable $exportedVariables

$posh.OnRemove = {
    
    if ($posh.Prompt.Stack -and $posh.Prompt.Stack.Count) {
        $function:Prompt = $posh.Prompt.Stack.ToArray()[-1]
    }    

    $host.pstypenames.Clear()
    $host.ui.pstypenames.Clear()
    $host.ui.RawUI.pstypenames.Clear()
    $global:ExecutionContext.pstypenames.clear()
    $global:error.pstypenames.clear()
    $global:PROFILE.pstypenames.clear()
    $global:PSDefaultParameterValues.pstypenames.clear()   
}