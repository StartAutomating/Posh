Write-FormatView -TypeName System.TimeZoneInfo -Property ID, LocalTime, DisplayName -AutoSize -AlignProperty @{
    ID = 'Right'
    LocalTime = 'Center'    
    DisplayName = 'Left'
} -VirtualProperty @{
    LocalTime = { 
        ' ' + $_.LocalTime.ToShortTimeString() + ' '
    }
} -StyleRow {
    if ($_.LocalTime.Hour -lt 6 -or $_.LocalTime.Hour -gt 18) {
        'Foreground.Blue','Italic'
    }
    else {
        'Foreground.Yellow','Bold'
    }
}