<#
.SYNOPSIS
    Pages the cursor down
.DESCRIPTION
    Pages the cursor N (default 1) pages down.  New lines are added at the top.    
.NOTES
    This method returns an escape sequence (it should be invisible).
#>
param(
    # How far the cursor should move
    [Alias('Rows')]
    [ValidateRange(1,1024)]
    [int]$Distance = 1
)

[Console]::Write("`e[${Distance}T")
