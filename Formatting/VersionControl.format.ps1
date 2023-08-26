Write-FormatView -TypeName n/a -Name VersionControl -Action {
    Write-FormatViewExpression -ScriptBlock {
        if ($PSStyle) {
            @(foreach ($versionPart in $_.ToString() -split "\.") {
                @(
                    $PSStyle.Foreground.Cyan
                    $PSStyle.Bold
                    $versionPart
                    $PSStyle.Reset
                ) -join ''            
            }) -join "$(
                @(
                    $PSStyle.Foreground.Blue
                    '.'
                ) -join ''      
            )"
        } else {
            $_.ToString()
        }
    }
} -AsControl