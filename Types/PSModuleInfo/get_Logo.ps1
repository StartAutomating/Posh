<#
.SYNOPSIS
    Gets Module Logos
.DESCRIPTION
    Lists logos for this module.
.EXAMPLE
    $posh.Logos
#>
$this.LinkList(@(
    $this.PrivateData.Logo
    $this.PrivateData.Logos
    $this.PrivateData.PSData.Logo
    $this.PrivateData.PSData.Logos
    $this.PrivateData.PSData.IconURI
), "Posh.Module.Logo")

