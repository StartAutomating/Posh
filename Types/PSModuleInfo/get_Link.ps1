<#
.SYNOPSIS
    Gets Module Links
.DESCRIPTION
    Lists hyperlinks from this module.
.EXAMPLE
    $posh.Links
#>
$this.LinkList(@(
    $this.PrivateData.Link
    $this.PrivateData.Links
    $this.PrivateData.Resource
    $this.PrivateData.Resources
    $this.PrivateData.PSData.Link
    $this.PrivateData.PSData.Links
    $this.PrivateData.PSData.Resource
    $this.PrivateData.PSData.Resources
), "Posh.Module.Link")

