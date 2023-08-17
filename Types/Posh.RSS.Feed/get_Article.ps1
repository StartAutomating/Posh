<#
.SYNOPSIS
    Gets articles in a feed.
.DESCRIPTION
    Gets the articles in a RSS feed.

    Articles will be cached for performance.
.EXAMPLE
    $Posh.News.Article # Get all articles from all feeds associated with Posh.
#>
if (-not $this.'.Article') {    
    Write-Progress "Getting Feeds" $this.Url 
    Add-Member -InputObject $this -MemberType NoteProperty -Name '.Article' -Value @(
        foreach ($feedItem in Invoke-RestMethod -Uri $this.Url) {
            $feedItem.pstypenames.insert(0,'Posh.RSS.Article')
            $feedItem | 
                Add-Member NoteProperty Source $this.Name -Force -PassThru
        }        
    ) -Force    
}
$this.'.Article'