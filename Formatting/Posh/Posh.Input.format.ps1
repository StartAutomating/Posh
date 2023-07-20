Write-FormatView -TypeName Posh.Input -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To reset the input, use `$posh.Input.Clear()"
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline


    Write-FormatViewExpression -If {
        $_.Stack.Count 
    } -ScriptBlock {
        ('The input has ' + $_.Stack.Count + ' modification(s)')
    } -Style 'Foreground.Yellow', 'Italic'
}