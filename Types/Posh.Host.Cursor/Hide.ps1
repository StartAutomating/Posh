<#
.SYNOPSIS
    Hides the cursor
.DESCRIPTION
    Hides the cursor.  This is not supported in all terminals.
.NOTES
    This method returns an escape sequence (it should be invisible).
#>
param()

"`e[25l"
