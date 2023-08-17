Write-FormatView -TypeName Posh.RSS.Feed -GroupByProperty Name -Action {
    Write-FormatViewExpression -ScriptBlock { $_.Recent } -ControlName Posh.Link.Line -Enumerate    
}

Write-FormatView -TypeName Posh.RSS.Feed -GroupByProperty Name -Action {
    Write-FormatViewExpression -ScriptBlock { $_.Article } -ControlName Posh.Link.Line -Enumerate
} -Name "All"