Write-FormatView -TypeName System.TimeSpan -Action {
    "$_"
} -Name Default


Write-FormatView -TypeName System.TimeSpan -Name 'ISO-8601' -Action {   
    $timespan = $_
    @(
        "P"
        if ([Math]::floor($timespan.TotalDays) -gt 0) {
            [Math]::floor($timespan.TotalDays)
            "D"
        }
        "T"
        if ([Math]::floor($timespan.TotalHours) -gt 0) {
            [Math]::floor($timespan.TotalHours % 24)
            "H"
        }
        if ([Math]::floor($timespan.TotalMinutes) -gt 0) {
            [Math]::floor($timespan.TotalMinutes % 60)
            "M"
        }
        if ([Math]::floor($timespan.TotalSeconds) -gt 0) {
            [Math]::floor($timespan.TotalSeconds % 60)
            "S"
        }
    ) -join ''
}
#>