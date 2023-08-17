<#
.SYNOPSIS
    Sets the duration considered recent
.DESCRIPTION
    Set the duration that is used to determine how recent an article is.
#>
param(
[Timespan]
$RecentDuration
)

$this | 
    Add-Member NoteProperty '.RecentDuration' $RecentDuration -Force