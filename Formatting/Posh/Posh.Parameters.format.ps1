Write-FormatView -TypeName Posh.Parameters -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To add defaults, use `$posh.Parameters.SetDefault()"
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline


    Write-FormatViewExpression -ScriptBlock {
        Format-Yaml -InputObject ($_.Defaults)
    } -If { $global:PSDefaultParameterValues.Count }
}