Write-FormatView -TypeName Posh.Host.Cursor -Property "Position.Row", "Position.Column" -VirtualProperty @{
    "Position.Row" = { $_.Position.Row }
    "Position.Column" = { $_.Position.Column }
}