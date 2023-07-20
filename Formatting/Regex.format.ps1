Write-FormatView -TypeName System.Text.RegularExpressions.RegEx -Action {
    $pattern = "$($_.ToString())"
    @(for ($i = 0; $i -lt $pattern.Length; $i++) {
        if ($pattern[$i -1] -eq '\') {
            if ($pattern[$i -2] -ne '\' -or ($pattern[$i -2] -eq '\' -and $pattern[$i -3] -eq '\')) {
                $pattern[$i]
                continue
            }
        }
        if ($i -and $pattern[$i] -eq '?' -and $pattern[$i + 1] -eq '<' -and $pattern[$i + 2] -match '[\w\-]') {
            # Group name
            if ($psStyle) {
                $psStyle.Foreground.Green
                $psStyle.Bold
            }                        
            $nameEnd = $pattern.IndexOf('>', $i)
            $pattern.Substring($i, 2)
            if ($psStyle) {
                $psStyle.Underline
            }
            
            $pattern.Substring($i + 2, $nameEnd - ($i + 2))
            if ($psStyle) {
                $psStyle.UnderlineOff
            }
            $i = $nameEnd
            '>'
            if ($psStyle) { $psStyle.Reset }
            continue
        }

        if ('(',')','[',']' -contains $pattern[$i]) {
            # Grouping paranthesis
            if ($psStyle) {
                $psStyle.Foreground.Yellow;$psStyle.Bold
                # . $SetOutputStyle -ForegroundColor Warning <#Irregular.Regex.Group#> -Bold
            }
            
            $pattern[$i]
            if ($psStyle) { $psStyle.Reset }            
            continue
        }

        if ('|','?','<','>','!' -contains $pattern[$i]) {
            if ($psStyle) { $psStyle.Formatting.Verbose }
            $pattern[$i]
            if ($psStyle) { $psStyle.Reset }            
            continue
        }

        if ($pattern[$i] -eq '#') {
            if ($psStyle) {
                $psStyle.Foreground.Green
                $psStyle.Bold
            }
            # . $SetOutputStyle -ForegroundColor Success # Irregular.Regex.Comment
            $lineEnd = $pattern.IndexOfAny([Environment]::NewLine.ToCharArray(), $i)
            if (($lineEnd - $i) -gt 0) {
                $pattern.Substring($i, $lineEnd -$i)
                $i = $lineEnd - 1

            } else {
                $pattern.Substring($i)
                $i = $pattern.Length
            }
            if ($psStyle) {
                $psStyle.Reset
            }            
            continue
        }


        $pattern[$i]
    }) -join ''

}

Write-FormatView -TypeName System.Text.RegularExpressions.RegEx -Property GroupNames, Pattern, Options, MatchTimeout -AsList

Write-FormatView -TypeName System.Text.RegularExpressions.RegEx -Property Pattern, GroupNames -Wrap
