Write-FormatView -TypeName Posh.RSS.Article -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Link    
} -GroupByProperty Source

Write-FormatView -TypeName Posh.RSS.Article -Property Title, Link