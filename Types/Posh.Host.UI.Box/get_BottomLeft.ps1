<#
.SYNOPSIS
    Gets a box's Bottom Left character
.DESCRIPTION
    Gets the Bottom Left character in a box
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theseLines[-1].Substring(0,1)

