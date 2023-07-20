Write-FormatCustomView -AsControl -Action {
    Write-FormatViewExpression -ScriptBlock { ' ' }
    Write-FormatViewExpression -Style 'Foreground.BrightCyan' -ScriptBlock {
        $_.Name
    }
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -ScriptBlock {
        $null = $_.OuterXml -match '=\s{0,}(?<q>["''])'
        if ($matches.Q) {
            '=' + $matches.Q
        }
    }
    Write-FormatViewExpression -Style 'Foreground.Magenta' -ScriptBlock {
        [security.SecurityElement]::Escape($_.Value)
    }
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -ScriptBlock {
        $null = $_.OuterXml -match '=\s{0,}(?<q>["''])'
        $matches.Q
    }

} -Name XmlAttributeControl