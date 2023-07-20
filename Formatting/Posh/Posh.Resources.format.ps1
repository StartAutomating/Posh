Write-FormatView -TypeName Posh.Resources -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    } -If { $_.README }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -ScriptBlock {
        $_ | 
            Select-Object -ExcludeProperty README -Property * | 
            Format-Yaml
    }    
}