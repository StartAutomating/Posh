Write-FormatView -TypeName Posh.RSS.Article -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Link
    Write-FormatViewExpression -If { $_.DatePublished -is [datetime] } -ScriptBlock {
        " ($($_.DatePublished.ToShortDateString())) "
    }
    Write-FormatViewExpression -If { $_.Enclosure } -ScriptBlock { $_ } -ControlName Posh.Link.Play

} -GroupByProperty Source

Write-FormatView -TypeName Posh.RSS.Article -Property Title, Link