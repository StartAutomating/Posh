<#
.SYNOPSIS
    Gets all recent articles
.DESCRIPTION
    Gets all recent articles in a feed collection, sorted by date published.
.NOTES
    How "Recent" is defined in the a feed collection's `.RecentDuration` property.
#>
@(foreach ($feed in $this.All) {
    $feed.Recent
}) | Sort-Object DatePublished -Descending