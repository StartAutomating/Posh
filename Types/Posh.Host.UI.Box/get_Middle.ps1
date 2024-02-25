<#
.SYNOPSIS
    Gets a box's middle character
.DESCRIPTION
    Gets the middle character in a box.

    If the box only has one line, and it is less than 5 characters, the UpperLeft will be treated as the middle.
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
if ($theseLines.Length -eq 1 -and $theseLines[0].Length -lt 5) {
    # If there is only one line, and it is less than five characters
    # Use the upper left as the middle character.
    $theseLines[0].Substring(0,1)
} else {
    $theLine = $theseLines[[Math]::Floor($theseLines.Length/2)]
    $theLine[[Math]::Floor($theLine.Length / 2)]    
}


