<#
.SYNOPSIS
    Gets recent articles
.DESCRIPTION
    Gets recent articles in an RSS feed.
#>
$after = $this.Source.News.RecentDuration
if (-not $after) {
    return       
}

foreach ($article in $this.Article) {    
    if (([DateTime]::Now - $article.DatePublished) -gt $after) {
        continue
    }
    $article
}