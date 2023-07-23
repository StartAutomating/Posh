<#
.SYNOPSIS
    Gets Module Recommendations
.DESCRIPTION
    Lists other modules this module recommends.
.EXAMPLE    
    # $Posh.Recommends gets every loaded module's recommendations.
    $posh.Recommends
.EXAMPLE
    $posh.Recommendations
#>
$module = $this

$this.LinkList(@(
    
    $module.PrivateData.Recommends
    $module.PrivateData.Recommend
    $module.PrivateData.Recommendation
    $module.PrivateData.Recommendations

    $module.PrivateData.PSData.Recommends
    $module.PrivateData.PSData.Recommend
    $module.PrivateData.PSData.Recommendation
    $module.PrivateData.PSData.Recommendations
), "Posh.Recommendation")


