Write-FormatView -TypeName Posh.Module.Screenshot -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Link    
} -GroupByProperty Source

Write-FormatView -TypeName Posh.Module.Screenshot -Property Name, Url -GroupByProperty Source