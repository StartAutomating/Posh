<#
.SYNOPSIS
    Moves the cursor up
.DESCRIPTION
    Moves the cursor N (default 1) cells up.    
    If the cursor is already at the edge of the screen, this has no effect.
#>
param(
    # How far the cursor should move
    [Alias('N')]
    [ValidateRange(1,1024)]
    [int]$Distance = 1
)

"`e[${Distance}A"


