<#
.SYNOPSIS
    Gets abstract types.
.DESCRIPTION
    Gets currently loaded abstract types.
.EXAMPLE
    $posh.Net.Abstract
#>
foreach ($type in $this.Type) {
    if ($type.Attributes -band 'Abstract') {
        $type
    }
}