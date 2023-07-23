<#
.SYNOPSIS
    Gets Module Videos
.DESCRIPTION
    Lists videos about this module.
.EXAMPLE
    $posh.Videos
#>
$this.LinkList(@(
    $this.PrivateData.Video
    $this.PrivateData.Videos
    $this.PrivateData.PSData.Video
    $this.PrivateData.PSData.Videos
), "Posh.Module.Video")

