Write-FormatView -Action {
    Write-FormatViewExpression -If { $_.N -gt 0} -ScriptBlock  { ', ' }
    Write-FormatViewExpression -Property ParameterType -ControlName TypeNameControl -Style 'Foreground.Cyan','Bold'
    Write-FormatViewExpression -ScriptBlock { '$' + $_.Name + ' ' } -Style 'Formatting.Warning' -If {$_.Name }    
} -TypeName TypeMethodParameterControl -Name TypeMethodParameterControl -AsControl
