switch -regex ($this.Source) {
    '\.psd1$' {
        (Import-LocalizedData -BaseDirectory ($this.Source | Split-Path) -FileName ($this.Source | Split-Path -Leaf)).Content
    }
    '\.json$' {
        (Get-Content $this.Source -Raw | ConvertFrom-Json).Content
    }
    '\.md$' {
        Show-Markdown -LiteralPath $this.Source        
    }
    '\.ps1$' {
        $showDemoCommand = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Show-Demo', 'Function')
        if ($showDemoCommand) {
            Show-Demo -DemoFile $this.Source -AutoPlay | Out-Null
        } else {
            Get-Content $this.Source -Raw
        }
    }
}