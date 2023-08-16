<#
.SYNOPSIS
    Gets a Module's News
.DESCRIPTION
    Lists RSS NewsFeeds from this module
.EXAMPLE
    $posh.News
#>

if (-not $this.'.News') {
    $this | 
        Add-Member NoteProperty '.News' @(
            $this.LinkList(@(
                $this.PrivateData.RSS
                $this.PrivateData.News
                $this.PrivateData.Feed
                $this.PrivateData.PSData.RSS
                $this.PrivateData.PSData.News
                $this.PrivateData.PSData.Feed
            ), "Posh.RSS.Feed")
        ) -Force
}

$this.'.News'