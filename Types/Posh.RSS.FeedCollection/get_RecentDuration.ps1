<#
.SYNOPSIS
    Gets the duration considered recent
.DESCRIPTION
    Gets the duration that is used to determine how recent an article is.

    By default, this is 45 days.    
#>
if (-not $this.'.RecentDuration') {
    $this | 
        Add-Member NoteProperty '.RecentDuration' (New-TimeSpan -Days 45) -Force
}

$this.'.RecentDuration'