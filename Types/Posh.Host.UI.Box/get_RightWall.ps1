<#
.SYNOPSIS
    Gets a box's Right Wall character
.DESCRIPTION
    Gets the Right Wall character in a box.
.NOTES
    If the box has a odd number of lines (greater than one),
    then the rightmost character above the middle will be considered the wall.
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
if ($theseLines.Length -gt 1 -and $theseLines.Length % 2) {
    $theLine = $theseLines[[Math]::Floor($theseLines.Length/2) - 1]
    $theLine.Substring($theLine.Length - 1)
} else {
    $theLine = $theseLines[[Math]::Floor($theseLines.Length/2)]
    $theLine.Substring($theLine.Length - 1)
}



