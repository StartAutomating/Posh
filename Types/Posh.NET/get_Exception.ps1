<#
.SYNOPSIS
    Gets exception types
.DESCRIPTION
    Gets all currently loaded exception types
.EXAMPLE
    $Posh.Net.Exception
.EXAMPLE
    $Posh.Net.Exceptions
#>
foreach ($type in $this.Type) {
    if ($type.IsSubclassOf([Exception])) {
        $type
    }
}