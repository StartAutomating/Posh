<#
.SYNOPSIS
    Gets a box's Middle Right character
.DESCRIPTION
    Gets the Middle Right character in a box
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theLine = $theseLines[[Math]::Floor($theseLines.Length/2)]
$theLine.Substring($theLine.Length - 1)


