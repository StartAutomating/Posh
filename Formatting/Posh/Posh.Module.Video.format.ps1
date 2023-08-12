Write-FormatView -TypeName Posh.Module.Video -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Link    
} -GroupByProperty Source

Write-FormatView -TypeName Posh.Module.Video -Property Name, Url -GroupByProperty Source