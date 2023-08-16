$pubDateTime = $this.pubDate -as [DateTime]
if ($pubDateTime) {
    $pubDateTime
}
else {
    [datetime]::MinValue
}