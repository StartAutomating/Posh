Write-FormatView -TypeName Posh.Preset.Collection -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline

    
}