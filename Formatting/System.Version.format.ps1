Write-FormatView -TypeName System.Version -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName VersionControl
}