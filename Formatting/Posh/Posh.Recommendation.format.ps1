Write-FormatView -TypeName Posh.Recommendation -Action {
    @(
    if ($_.Name -and $_.Url) {
        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
            $psStyle.FormatHyperlink($_.Name, $_.Url)
        } else {
            "[$($_.Name)]($($_.Url))"
        }
    } elseif ($_.Url) {
        $uri = [uri]$_.Url
        if (-not $uri.Authority) {
            $uri = "https://www.powershellgallery.com/packages/$($uri)"
        }

        if ($psStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
            $psStyle.FormatHyperlink($_.Url, $uri)
        } else {
            "[$($_.Url)]($($uri))"
        }        
    }    
    ) -join ''    
} -GroupByProperty Source
 
Write-FormatView -TypeName Posh.Recommendation -Property Name, Url -GroupByProperty Source