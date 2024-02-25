<#
.SYNOPSIS
    Gets a box's Bottom Right character
.DESCRIPTION
    Gets the Bottom Right character in a box
#>

$theseLines = @($this -split '[\r\n]+' -ne '')

if (-not $theseLines) { return }
$theseLines[-1].Substring($theseLines[-1].Length - 1)

