<#
.SYNOPSIS
    Gets a box's bottom wall character
.DESCRIPTION
    Gets the bottom wall in a box.
.NOTES
    If the box only has one line, and it is less than 5 characters, the second character will be considered the bottom wall.
    
    If it only has one character, it will be considered the bottom wall.

    Otherwise, the character directly left of the middle will be considered the bottom wall.
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theLine = $theseLines[-1]
if ($theLine.Length -lt 5) {
    # If there is only one line, it is between two and five characters    
    if ($theLine.Length -ge 2) {
        # pick the second character as the top wall
        $theLine.Substring(1,1)
    } else {
        # (if there was only one character, it's the top wall)
        $theLine.Substring(0,1)
    }    
} else {
    # Otherwise, pick one left of the middle in the line
    $theLine.Substring(([Math]::Floor($theLine.Length / 2) - 1), 1)
}