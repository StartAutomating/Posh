Write-FormatView -TypeName Posh.Prompt -Action {
    Write-FormatViewExpression -Style 'Foreground.Green', 'Bold' -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To reset the prompt, use `$posh.Prompt.Clear()"
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline


    Write-FormatViewExpression -If {
        $_.Stack.Count 
    } -ScriptBlock {
        ('The prompt has ' + $_.Stack.Count + ' modification(s)')
    } -Style 'Foreground.Yellow', 'Italic'
}