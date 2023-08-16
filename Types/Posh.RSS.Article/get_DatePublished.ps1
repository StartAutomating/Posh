<#
.SYNOPSIS
    Gets an article's date published
.DESCRIPTION
    Gets the date an article was published, as a `[DateTime]`.
.EXAMPLE
    $Posh.News.Article.DatePublished
#>
$pubDateTime = $this.pubDate -as [DateTime]

if ($pubDateTime) {
    $pubDateTime
}
else {
    [datetime]::MinValue
}