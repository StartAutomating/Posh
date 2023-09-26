<#
.SYNOPSIS
    Gets enumerated typed
.DESCRIPTION
    Gets all currently loaded enumerated types
.EXAMPLE
    $Posh.Net.Enum
.EXAMPLE
    $Posh.Net.Enums
#>
foreach ($type in $this.Type) {
    if ($type.IsEnum) {
        $type
    }
}