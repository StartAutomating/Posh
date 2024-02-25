<#
.SYNOPSIS
    Gets a box's TopMiddle character
.DESCRIPTION
    Gets the TopMiddle character in a box
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theseLines[0][
    [Math]::Floor($theseLines[0].Length / 2)
]    


