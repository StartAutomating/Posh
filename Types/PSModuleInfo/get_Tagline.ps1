<#
.SYNOPSIS
    Gets module taglines    
.DESCRIPTION
    Gets module taglines.  A tagline is an alternate description often used for posts and articles.

    Modules can only have one description, but can have as many taglines as they want.
#>
param()
@(
    $this.PrivateData.Tagline,
    $this.PrivateData.Taglines,
    $this.PrivateData.PSData.Tagline,
    $this.PrivateData.PSData.Taglines
) -ne $null | & { process { $_ } }
