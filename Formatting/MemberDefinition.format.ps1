$colorNameAndMemberType = 
    {
        
        @(
        if ($_.MemberType -notin 'Method','Property','ParemeterizedProperty') {
            "Italic"
        }
        if ($_.MemberType -like '*property*') {        
            "Foreground.Green"            
            "Bold"
        }
        elseif ($_.MemberType -like '*method' -or $_.MemberType -eq 'Event') {
            "Formatting.Warning"
        })        
    }

Write-FormatView -TypeName Microsoft.PowerShell.Commands.MemberDefinition -Property Name, MemberType, Definition -StyleProperty @{
    Name = $colorNameAndMemberType
    MemberType = $colorNameAndMemberType    
} -GroupByProperty TypeName -VirtualProperty @{
    Definition = {
        $findOverloads = [Regex]::new('(?<=^|\))[\s\p{P}]{0,}(?<Type>\S{1,})\s{1,}(?<Name>\w{1,})', 'IgnoreCase', '00:00:01')
        $definition = $_.definition
        $memberInfo = $_
        $foundOverloads = @(foreach ($m in $findOverloads.Matches($Definition)) {$m.Groups["Type","Name"]})
        
        
        $chars         = $definition.ToCharArray()
        $overload      = $null
        $overloadIndex = 0
        $innerDepth = 0
        $overloadTypeDefined = $false
        @(for($i = 0; $i -lt $chars.length; $i++) {
            if (-not $overload) {
                if ($foundOverloads[$overloadIndex].Index -eq $i) {                    
                    $overload = $foundOverloads[$overloadIndex]
                    if ($overload.Name -eq 'Type') {
                        if ($psStyle) {
                            $psStyle.Foreground.BrightCyan
                            $psStyle.Foreground.Bold
                        }
                    } else {
                        if ($psStyle) {
                            $psStyle.Formatting.Warning
                        }
                        
                    }
                    $overloadTypeDefined = $false
                }

            }
            switch ($chars[$i]) {
                '(' {
                    if ($psStyle) {$psStyle.Formatting.Warning}
                    '('
                    if ($psStyle) {$psStyle.Reset}
                    $innerDepth++
                }
                ')' {
                    if ($psStyle) {$psStyle.Formatting.Warning}
                    ')'
                    if ($psStyle) {$psStyle.Reset}
                    $innerDepth--                    
                }
                '{' {
                    if ($psStyle) {$psStyle.Foreground.Magenta;$psStyle.Foreground.Bold}
                    '{'
                    if ($psStyle) {$psStyle.Reset}
                    $innerDepth++
                }
                '}' {
                    if ($psStyle) {$psStyle.Foreground.Magenta;$psStyle.Foreground.Bold}
                    $innerDepth--
                    '}'
                    if ($psStyle) {$psStyle.Reset}                    
                }
                ';' {
                    if ($psStyle) {$psStyle.Foreground.BrightCyan}
                    ';'
                    if ($psStyle) {$psStyle.Reset}
                }
                
                ',' {
                    
                    if ($psStyle) {
                        $psStyle.Foreground.BrightCyan
                    }
                    ','
                    if ($psStyle) {
                        $psStyle.Reset
                    }
                
                    
                }
                
                default {
                    if ($memberInfo.MemberType -eq 'ScriptMethod') {
                        if (-not $innerDepth) {
                            $chars[$i]
                        }
                    }  else {
                        $chars[$i]
                    }
                    
                }
            }
            
            
            if ($overload -and ($i -eq ($overload.Index + $overload.Length))) {
                $overload = $null
                $overloadIndex++
                if ($psStyle) {
                    $psStyle.Reset
                }
            }
            
        }) -join ''
    }
}
