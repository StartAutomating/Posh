<#
.SYNOPSIS
    Gets the height of the host
.DESCRIPTION
    Gets the height of the host (in characters).
.EXAMPLE
    $posh.Host.Height
.EXAMPLE
    $Host.Height
#>
$this.UI.RawUI.BufferSize.Height