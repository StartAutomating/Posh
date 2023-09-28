<#
.SYNOPSIS
    Gets primitive types
.DESCRIPTION
    Gets all primitive types.

    Primitive types are used to build all other types.
.EXAMPLE
    $Posh.Net.Primitive
#>
foreach ($type in $this.Type) {
    if ($type.IsPrimitive) {
        $type
    }
}