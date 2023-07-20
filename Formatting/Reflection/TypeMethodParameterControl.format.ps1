Write-FormatView -Action {
    Write-FormatViewExpression -If { $_.N -gt 0} -ScriptBlock  { ', ' }
    Write-FormatViewExpression -Property ParameterType -ControlName TypeNameControl -Style 'Formatting.Verbose'
    Write-FormatViewExpression -ScriptBlock { '$' + $_.Name } -Style 'Formatting.Warning'
    Write-FormatViewExpression -ScriptBlock { ' ' }
} -TypeName TypeMethodParameterControl -Name TypeMethodParameterControl -AsControl
