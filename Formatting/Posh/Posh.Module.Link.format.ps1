Write-FormatView -TypeName Posh.Module.Link -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Link    
} -GroupByProperty Source

Write-FormatView -TypeName Posh.Module.Link -Property Name, Url -GroupByProperty Source