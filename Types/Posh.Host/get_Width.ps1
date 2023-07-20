<#
.SYNOPSIS
    Gets the Width of the host
.DESCRIPTION
    Gets the Width of the host (in characters).
.EXAMPLE
    $posh.Host.Width
.EXAMPLE
    $Host.Width
#>
$this.UI.RawUI.BufferSize.Width