<#
.SYNOPSIS
    Gets cmdlet types
.DESCRIPTION
    Gets .net types that are subclasses of Cmdlet.
.EXAMPLE
    $posh.Net.Cmdlet
.EXAMPLE
    $posh.Net.Cmdlets

#>
foreach ($type in $this.Public) {
    if ($type.IsSubclassOf([Management.Automation.Cmdlet])) {
        $type
    }
}