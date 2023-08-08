Write-FormatView -TypeName Microsoft.PowerShell.Commands.MatchInfo -Action {
    $matchInfo = $_
    $isFileMatch = $matchInfo.Path -and ($matchInfo.Path -ne 'InputStream')
    $currentLocation = $ExecutionContext.SessionState.Path.CurrentLocation
    $relativePath = $matchInfo.RelativePath($currentLocation)
    $originalLine = $(
        if ($matchInfo.ToEmphasizedString) {
            $matchInfo.ToEmphasizedString($currentLocation)
        } elseif ($isFileMatch) {
            $matchInfo.ToString().Replace($matchInfo.Path, $relativePath)
        } else {
            $matchInfo.ToString()
        }
    )

    if ($PSStyle) {
        if ($isFileMatch) {
            # Match in a file item
            $colorTable = @(
                $PSStyle.Foreground.Green
                $PSStyle.Foreground.Yellow
            )

            $colorIndex = & $Posh {
                # Create a module scope variable
                if (-not $script:MatchInfoColorIndex) {
                    $script:MatchInfoColorIndex = @{
                        index = 0
                        lastFilepath = $args[0]
                    }
                }
                $script:MatchInfoColorIndex
            } $relativePath
            if ($colorIndex.lastFilepath -ne $relativePath) {
                $colorIndex.index = ($colorIndex.index + 1) % $colorTable.Count
                $colorIndex.lastFilepath = $relativePath
            }

            $color = $colorTable[$colorIndex.index]
            $coloredPath = $color + $relativePath + $PSStyle.Reset
            
            if ($PSStyle.FormatHyperlink -and -not $env:GITHUB_WORKSPACE) {
                $hyperLink = $PSStyle.FormatHyperlink($coloredPath, $matchInfo.Path)
                $originalLine.Replace($relativePath, $hyperLink)
            } else {
                $originalLine.Replace($relativePath, $coloredPath)
            }
        } else {
            # Match in a text input
            $originalLine
        }
    } else {
        $originalLine
    }
}
