# In PowerShell, you can assign the results of any expression.

# Including an `if`!

$IsFriday = 
    if ([DateTime]::now.DayOfWeek -as [int] -eq 5) {
        $true
    }

$IsFriday