Write-FormatView -TypeName n/a -Name "Posh.Link" -AsControl -Action {
    @(
    if ($_.Name -and $_.Url) {
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
            $psStyle.FormatHyperlink($_.Name, $_.Url)
        } else {
            "[$($_.Name)]($($_.Url))"
        }
    } elseif ($_.Url) {
        $uri = [uri]$_.Url
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
            $psStyle.FormatHyperlink($_.Url, $uri)
        } else {
            "[$($_.Url)]($($uri))"
        }        
    }    
    ) -join ''
}

Write-FormatView -TypeName n/a -Name "Posh.Link.Play" -AsControl -Action {
    @(
    if ($_.enclosure.url -and 
        $psStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
            " $($psStyle.FormatHyperlink("▶", $_.enclosure.url)) "
    }
    ) -join ''
}

Write-FormatView -TypeName n/a -Name "Posh.Link.Line" -AsControl -Action {
    Write-FormatViewExpression -ControlName Posh.Link -ScriptBlock { $_ }
    Write-FormatViewExpression -Newline    
}