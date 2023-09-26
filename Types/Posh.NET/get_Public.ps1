<#
.SYNOPSIS
    Gets public types
.DESCRIPTION
    Gets all currently loaded public types.
.EXAMPLE
    $Posh.Net.Public
#>
foreach ($type in $this.Type) {
    if ($type.IsPublic) {
        $type
    }
}