<#
.SYNOPSIS
    Gets .NET extension types
.DESCRIPTION
    Gets .NET Extension Types.
    
    These types define extension methods for LINQ.
#>
:nextType foreach ($type in $this.Type) {
    foreach ($attr in $type.GetCustomAttributes($false)) {
        if ($attr -is [Runtime.CompilerServices.ExtensionAttribute]) {
            $type
            continue nextType
        }
    }
}