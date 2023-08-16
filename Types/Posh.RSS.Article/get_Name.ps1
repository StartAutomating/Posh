<#
.SYNOPSIS
    Gets an article's name
.DESCRIPTION
    Gets the name of an article in an RSS feed.
#>
if ($this.Title -isnot [string]) {
    $this.Title.InnerText
} else {
    $this.Title
}