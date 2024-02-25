<#
.SYNOPSIS
    Gets a box's TopMiddle character
.DESCRIPTION
    Gets the TopMiddle character in a box
.NOTES
    If there is only one line, and it is shorter than 5 characters, then the TopLeft will be considered the TopMiddle
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
if ($theseLines.Length -eq 1 -and $theseLines[0].Length -lt 5) {
    # If there is only one line, and it is less than five characters
    # Use the upper left as the middle character.
    $theseLines[0].Substring(0,1)
} else {
    $theseLines[0].Substring(
        ([Math]::Floor($theseLines[0].Length / 2)), 1
    )    
}



