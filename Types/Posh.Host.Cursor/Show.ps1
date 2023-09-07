<#
.SYNOPSIS
    Shows the cursor
.DESCRIPTION
    Shows the cursor.  This is not supported in all terminals.
.NOTES
    This method returns an escape sequence (it should be invisible).
#>
param()

"`e[25h"
