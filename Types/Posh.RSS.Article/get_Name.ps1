<#
.SYNOPSIS
    Gets an article's name
.DESCRIPTION
    Gets the name of an article in an RSS feed.
#>
if ($this.Title -and $this.Title -isnot [string]) {
    if ($this.Title.InnerText) {
        $this.Title.InnerText
    } elseif ($this.Title -is [object[]]) {
        $this.Title | Select-Object -Unique -First 1
    }    
} elseif ($this.Title) {
    $this.Title
} elseif ($this.URL) {
    $thisURI = $this.URL -as [uri]
    $thisURI.Segments[-1] -replace '-', ' '
}