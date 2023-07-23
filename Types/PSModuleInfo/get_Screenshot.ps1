<#
.SYNOPSIS
    Gets Module Screenshots
.DESCRIPTION
    Lists screenshots from this module.
.EXAMPLE
    $posh.Screenshots
#>
$this.LinkList(@(
    $this.PrivateData.Screenshot
    $this.PrivateData.Screenshots
    $this.PrivateData.PSData.Screenshot
    $this.PrivateData.PSData.Screenshots
), "Posh.Module.Screenshot")

