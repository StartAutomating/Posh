<#
.SYNOPSIS
    Gets generic types.
.DESCRIPTION
    Gets currently loaded generic types.
.EXAMPLE
    $Posh.Net.Generic
.EXAMPLE
    $Posh.Net.Generics
#>
foreach ($type in $this.Type) {
    if ($type.IsGenericType) {
        $type
    }
}