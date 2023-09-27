<#
.SYNOPSIS
    Gets Value Types
.DESCRIPTION
    Gets currently loaded .NET value types
    
    (types that represent a single value)
.EXAMPLE
    $posh.Net.ValueType
.EXAMPLE
    $Posh.Net.ValueTypes
#>
foreach ($type in $this.Type) {
    if ($type.IsValueType) {
        $type
    }
}