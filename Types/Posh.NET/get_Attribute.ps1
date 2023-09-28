<#
.SYNOPSIS
    Gets attribute types
.DESCRIPTION
    Gets all currently loaded attribute types
.EXAMPLE
    $Posh.Net.Attribute
.EXAMPLE
    $Posh.Net.Attributes
#>
foreach ($type in $this.Type) {
    if ($type.IsSubclassOf([Attribute])) {
        $type
    }
}