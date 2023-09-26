<#
.SYNOPSIS
    Gets private types
.DESCRIPTION
    Gets all currently loaded private types
.EXAMPLE
    $Posh.Net.Private
#>
foreach ($type in $this.Type) {
    if ($type.IsNotPublic) {
        $type
    }
}