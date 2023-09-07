<#
.SYNOPSIS
    Moves the cursor down
.DESCRIPTION
    Moves the cursor N (default 1) cells down.    
    If the cursor is already at the edge of the screen, this has no effect.
.NOTES
    This method returns an escape sequence (it should be invisible).
#>
param(
    # How far the cursor should move    
    [ValidateRange(1,1024)]
    [int]$Distance = 1
)

"`e[${Distance}B"
