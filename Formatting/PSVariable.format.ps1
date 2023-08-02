Write-FormatView -TypeName System.Management.Automation.PSVariable -Property Name, Value -StyleProperty @{
    Name = {
        if ($_.Options -band 'ReadOnly' -or $_.Options -band 'Constant') {
            "Bold", "Foreground.Green"
        }        
    }
} -GroupLabel "ReadOnly / Constant Variables" -GroupByScript {
    "In $($psStyle.Foreground.Green;$psStyle.Bold)Bold Green$($psStyle.Foreground.Reset)"    
}