Write-FormatControl -Name TypeFieldControl -Action {
    Write-FormatViewExpression -If { -not $script:DisplayingMember  } -ScriptBlock { [Environment]::NewLine }
    Write-FormatViewExpression -ScriptBlock { '  * '}
    Write-FormatViewExpression -Property FieldType -ControlName TypeNameControl -Style 'Foreground.Cyan', 'Bold'
    Write-FormatViewExpression -Property Name -Style 'Formatting.Warning'
}