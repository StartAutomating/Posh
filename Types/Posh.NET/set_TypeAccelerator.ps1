<#
.SYNOPSIS
    Sets type accelerators
.DESCRIPTION
    Sets type accelerators (aliases for types)
.EXAMPLE
    $posh.Net.TypeAccelerator = @{'t'=[type]}
.EXAMPLE
    $posh.Net.Alias = 't10', [type]
#>
param()

$accelerators = [psobject].assembly.gettype("System.Management.Automation.TypeAccelerators")
$currentString = ''

$unrolledArgs = $args | . { process { $_ } }
foreach ($arg in $unrolledArgs) {    
    if ($arg -is [Collections.IDictionary]) {
        
        foreach ($kv in $arg.GetEnumerator()) {
            if ($kv.Value -as [type]) {
                $null = $accelerators::Add($kv.Key, $kv.Value)
            }
        }
    }
    elseif ($arg -is [string]) {
        
        $currentString = "$arg"
    }
    elseif ($arg -is [type] -and $currentString) {
        
        $null = $accelerators::Add($currentString, [type]$arg)
        $currentString = ''
    } else {
        
    }
}