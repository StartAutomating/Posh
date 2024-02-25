<#
.SYNOPSIS
    Gets a box's Top Right character
.DESCRIPTION
    Gets the Top Right character in a box
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theseLines[0].Substring($theseLines[0].Length - 1)

