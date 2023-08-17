Write-FormatView -TypeName Posh.RSS.FeedCollection -Action {
    Write-FormatViewExpression -ScriptBlock {
        Show-Markdown -InputObject $_.README
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        @(
        "Feeds: "
        ""
        foreach ($feed in $_.All) {
            "* $($feed.Name)"
        }
        ) -join [Environment]::NewLine
    }    
}