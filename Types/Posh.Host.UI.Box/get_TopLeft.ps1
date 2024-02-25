<#
.SYNOPSIS
    Gets a box's TopLeft character
.DESCRIPTION
    Gets the TopLeft character in a box
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theseLines[0].Substring(0,1)

