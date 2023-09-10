Write-FormatView -TypeName System.Management.Automation.ApplicationInfo -Property Name, Source

Write-FormatView -TypeName System.Management.Automation.CommandInfo, System.Management.Automation.AliasInfo,
    System.Management.Automation.ApplicationInfo,
    System.Management.Automation.CmdletInfo,
    System.Management.Automation.ExternalScriptInfo,
    System.Management.Automation.FilterInfo,
    System.Management.Automation.FunctionInfo -GroupByProperty CommandType -Property Name, Source -StyleProperty @{
        Name = {
            switch -regex ($_.Name) 
            {
                '^(?>Add|New)\p{P}' { 'Foreground.Green' }
                '^(?>Get|Test|Sort|Select|Compare)\p{P}' { 'Foreground.Green', 'Bold' }
                '^(?>Out|Format|Show)\p{P}' { 'Foreground.Magenta', 'Bold' }
                '^(?>Measure|Write|Read|Push|Pop)\p{P}' { 'Foreground.Magenta' }
                '^(?>Convert|Import|Export)\p{P}' { 'Foreground.Blue', 'Bold' }
                '^(?>ConvertTo|ConvertFrom|Copy)\p{P}' { 'Foreground.BrightBlue' }
                '^(?>Move)\p{P}' { 'Foreground.BrightBlue','Bold' }
                '^(?>Send|Receive)\p{P}' { 'Foreground.BrightBlue' }
                '^(?>Lock|Unlock|Block|Unblock)\p{P}' { 'Foreground.BrightBlue' }
                '^(?>Protect|Unprotect)\p{P}' { 'Foreground.Red' }
                '^(?>Start|Stop)\p{P}'   { 'Foreground.Magenta', 'Bold' }
                '^(?>Install|Uninstall)\p{P}'   { 'Foreground.Magenta', 'Bold' }
                '^(?>Register|Unregister)\p{P}'   { 'Foreground.Yellow' }
                '^(?>Connect|Disconnect)\p{P}'   { 'Foreground.BrightBlue' }
                '^(?>Enter|Exit)\p{P}'   { 'Foreground.Yellow' }
                '^(?>Wait)\p{P}' { 'Foreground.Yellow', 'Italic'}
                '^(?>Remove|Rename|Exit|Debug)\p{P}' { 'Foreground.Red', 'Bold' }
                '^(?>Invoke|Use)\p{P}' { 'Foreground.BrightYellow', 'Italic'}
                '^(?>Set|Restart|Reset|Update|Clear)\p{P}' { 'Foreground.Yellow' }
                '^(?>Enable|Resume)\p{P}'  { 'Foreground.Green' }
                '^(?>Disable|Suspend)\p{P}' { 'Foreground.Yellow' }
            }
        }
    }