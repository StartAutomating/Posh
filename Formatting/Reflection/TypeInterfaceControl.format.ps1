Write-FormatView -Action {
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -ScriptBlock { '  *' }
    Write-FormatViewExpression -ControlName TypeNameControl -ScriptBlock  {$_ } -Style 'Foreground.Cyan', 'Bold'
} -TypeName n/a -Name TypeInterfaceControl -AsControl
