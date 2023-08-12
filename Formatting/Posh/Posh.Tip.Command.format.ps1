Write-FormatView -TypeName Posh.Tip.Command -Action {
    Write-FormatViewExpression -ScriptBlock { $_ } -ControlName Posh.Tip.Control
}

Write-FormatView -TypeName n/a -Name Posh.Tip.Control -AsControl -Action {
    Write-FormatViewExpression -ScriptBlock {
        $showDemoCommand = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Show-Demo', 'Function')
        if ($showDemoCommand -and $_.Content -is [scriptblock]) {
            Show-Demo -DemoScript $_.Content -AutoPlay | Out-Null
        } else {
            $_.Content
        }                
    }
}