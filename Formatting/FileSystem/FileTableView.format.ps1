Write-FormatView -TypeName FileSystemTypes -Property LastWriteTime, Length, Name  -AlignProperty ([Ordered]@{
    LastWriteTime = "Right"
    Length        = "Right"    
    Name          = "Left"
}) -VirtualProperty @{
    Length       = {
        if ($_.Length) {
            if ($_.Length / 1gb -eq 1) {
                '' + $([Math]::Round($_.Length / 1gb, 2)) + 'gb'
            }
            elseif ($_.Length / 1mb -ge 1) {
                '' + $([Math]::Round($_.Length / 1mb, 2)) + 'mb'
            }
            elseif ($_.Length -gt 1kb) {
                '' + $([Math]::Round($_.Length / 1kb, 2)) + 'kb'
            } elseif ($_ -isnot [IO.DirectoryInfo]) {
                $_.Length
            }
        }
    }
    Name = {
        $fileInfo = $_
        $formatTerminalIcons = $($executionContext.sessionState.InvokeCommand.GetCommands('Format-TerminalIcons', 'Function', $false))
        
        @(if ($formatTerminalIcons) {
            . $formatTerminalIcons $_
        } else {
            
            $(if ($_ -is [IO.DirectoryInfo]) {                
                $PSStyle.FileInfo.Directory                
                "`u{1F5BF} "
            } else {
                if (
                    $PSStyle.FileInfo.Extension.Keys -and 
                    $PSStyle.FileInfo.Extension[$_.Extension]
                ) {
                    $PSStyle.FileInfo.Extension[$_.Extension]
                }
                
                if ($psStyle.FileInfo.Pattern.Keys -and $(
                    $MatchingPatterns = 
                        @(foreach ($filePattern in $psStyle.FileInfo.Pattern.Keys) {
                            if ($fileInfo.Name -match $filePattern -or 
                                $fileInfo.Fullname -match $filePattern) {
                                $filePattern                            
                            }
                        })
                    $MatchingPatterns
                )
                ) {
                    foreach ($MatchingPattern in $MatchingPatterns) {
                        $PSStyle.FileInfo.Pattern[$MatchingPattern]
                    }
                }
                
                
                
                $extraSpace = $true
                if ($Posh.FileIcons) {

                } else {
                    
                    $(switch ($_.Extension) {
                        .ps1 {
                            "⟩"
                        }
                        .sh {'⟩'}
                        .zip {
                           "⧯" 
                        }
                        .deb {"⧯"}
                        .pkg {"⧯"}
                        .nupkg {"⧯"}
                        .msixbundle {"⧯"}
                        .srt { '⧳'}
                        .vtt { '⧳'}
                        .exe {
                            '⋇'
                        }
                        .psd1 {
                           "⧳" # ⨇ 
                        }
                        .psm1 {
                            '⧳' # '⨈'
                        }
                        .ttf { '🗛'}
                        .woff { '🗛'}
                        .fon { '🗛'}
                        .ttc { '🗛'}
                        .json {
                           "⧳" 
                        }
                        .mp3 {'♬'}
                        .wav {'♬'}
                        .txt { 
                            '🖉';
                            $extraSpace = $false
                        }
                        .md {
                            '🖉'
                            $extraSpace = $false
                        }
                        .inf {'⚙' }
                        .ini {'⚙ '}
                        .mpg {'▰' }
                        .mp4 {'▰' }
                        .mkv {'▰' }
                        .avi {'▰' }
                        .gif {'▰' }
                        .jpg { '▭' }
                        .png { '▭' }                        
                        .svg { '⬢' }
                        .ico { '⬢' }
                        
                        .ps1xml { "⧳"}
                        .clixml { "⧳"}
                        .clix { "⧳" }
                        .xml { "⧳" }
                        
                        default {
                            " "
                        }
                    }) + $(if ($extraSpace) { ' ' })
                    
                }

                
            }) + $(
                if ($PSStyle.FormatHyperlink) {
                    $PSStyle.FormatHyperlink($fileInfo.Name, [uri]$fileInfo.Fullname)
                } else {
                    $fileInfo.Name
                }
            )
                        
            $PSStyle.Reset
        }) -ne '' -join ''

        
    }
} -IsSelectionSet -GroupAction FileSystemTypes-GroupingFormat -GroupByProperty PSParentPath -Width 22, 10, 0