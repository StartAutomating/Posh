Write-FormatView -Type System.ServiceProcess.ServiceController -Property Status, Name, DisplayName -StyleProperty @{
    Status = {
        switch ($_.Status) {            
            Stopped {
                'Formatting.Warning'
            }
            Running { 
                'Foreground.Green','Bold'                
            }
            default {
                'Formatting.Error'
            }            
        }            
    }
} -AutoSize