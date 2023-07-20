Write-FormatView -TypeName Posh.Profiles -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Text "The current profile is:"

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline
    

    Write-FormatViewExpression -Style Italic -Property Current

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline


    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To add to your profile, use `$posh.Profile.Add()"
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To remove from your profile, use `$posh.Profile.Remove()"
    }
}