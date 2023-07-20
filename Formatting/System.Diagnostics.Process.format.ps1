Write-FormatControl -Name ProcessGroupControl -Action {
    Write-FormatViewExpression -ScriptBlock {
        . $Indent $_.ProcessName
    }
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -ScriptBlock {
        . $Indent $_.Path
    }
}

Write-FormatView -TypeName System.Diagnostics.Process -Property Handles, 'NPM(K)', 'PM(K)','WS(K)','CPU(S)', 'ID', 'SI','ProcessName' -VirtualProperty @{
    'NPM(K)' = { [long]($_.NPM / 1024) } 
    'PM(K)' = { [long]($_.PM / 1024) }
    'WS(K)' = { [long]($_.WS / 1024) }
    'CPU(S)' = { 
        if ($_.CPU -ne $()) { 
            $_.CPU.ToString("N") 
        }
    }    
} -ColorProperty @{
    'NPM(K)' = {
        Format-Heatmap -InputObject $_.NPM -HeatMapMin 16mb -HeatMapMiddle .5gb -HeatMapMax 1gb 
    }
    'PM(K)' = { 
        Format-Heatmap -InputObject $_.PM -HeatMapMin 16mb -HeatMapMiddle .5GB -HeatMapMax 1gb 
    }
    'WS(K)' = {
        Format-Heatmap -InputObject $_.WS -HeatMapMin 16mb -HeatMapMiddle 512mb -HeatMapMax 1gb 
    }  
} -Name Process.Heatmap


Write-FormatView -TypeName System.Diagnostics.Process -Property ID -AsList -GroupByProperty ProcessName -GroupAction ProcessGroupControl -Name process