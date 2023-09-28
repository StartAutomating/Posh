<#
.SYNOPSIS
    Gets static types.
.DESCRIPTION
    Gets currently loaded static types.
.EXAMPLE
    $posh.Net.Abstract
#>
foreach ($type in $this.Type) {
    if ($type.Attributes -band 'Abstract,Sealed') {
        $type
    }
}