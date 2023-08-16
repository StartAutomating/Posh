if (-not $this.'.RecentDuration') {
    $this | 
        Add-Member NoteProperty '.RecentDuration' (New-TimeSpan -Days 45) -Force
}

$this.'.RecentDuration'