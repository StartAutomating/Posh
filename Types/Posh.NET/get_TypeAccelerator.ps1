<#
.SYNOPSIS
    Gets type accelerators
.DESCRIPTION
    Gets currently loaded type accelerators.
.EXAMPLE
    $posh.Net.TypeAccelerator
.EXAMPLE
    $Posh.Net.TypeAccelerators
.EXAMPLE
    $Posh.Net.Alias
.EXAMPLE
    $Posh.Net.Aliases
#>

$accelerators = ([psobject].assembly.gettype("System.Management.Automation.TypeAccelerators")::Get)
$acceleratorOutput = [Ordered]@{PSTypeName='Posh.Type.Accelerator'}
foreach ($kv in $accelerators.GetEnumerator()) {
    if ($kv.Key -ne 'PSObject') {
        $acceleratorOutput[$kv.Key] = $kv.Value    
    }    
}
[PSCustomObject]$acceleratorOutput