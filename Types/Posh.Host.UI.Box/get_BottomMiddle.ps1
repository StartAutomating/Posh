<#
.SYNOPSIS
    Gets a box's Bottom Middle character
.DESCRIPTION
    Gets the Bottom Middle character in a box
#>
$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
    $theseLines[-1][
        [Math]::Floor($theseLines[-1].Length / 2)
    ]    


