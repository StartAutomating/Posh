<#
.SYNOPSIS
    Gets a box's Middle Left character
.DESCRIPTION
    Gets the Middle Left character in a box
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theLine = $theseLines[[Math]::Floor($theseLines.Length/2)]
$theLine.Substring(0,1)


