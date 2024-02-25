<#
.SYNOPSIS
    Gets a box's middle vertical wall character
.DESCRIPTION
    Gets the middle vertical wall in a box.
.NOTES
    If the box only has one line, and it is less than 5 characters, the second character will be considered the top wall.
    
    If it only has one character, it will be considered the middle wall.

    Otherwise, the character directly left of the middle will be considered the middle wall.
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theLine = $theseLines[[Math]::Floor($theseLines.Length / 2)]
if ($theLine.Length -lt 5) {
    # If there is only one line, it is less than five characters    
    return $theLine.Substring(0,1) # treat the upper left as the vertical wall.
} 
elseif ($theseLines.Length -gt 1) {
    $theLine = $theseLines[[Math]::Floor($theseLines.Length / 2) - 1]    
}

# Otherwise, pick the middle of the line
$theLine.Substring(([Math]::Floor($theLine.Length / 2)), 1)
