@{
    ModuleVersion = '0.2'
    FormatsToProcess = 'Posh.format.ps1xml'
    TypesToProcess   = 'Posh.types.ps1xml'
    RootModule = 'Posh.psm1'
    Description = 'PowerShell made Posh - Spice up Your Shell'
    Guid = 'd4d3a0b9-0c65-4474-bcfc-5b85b2670312'
    Author = 'James Brundage'
    CompanyName = 'Start-Automating'
    Copyright = '2023 Start-Automating'
    PrivateData = @{
        PSData = @{
            ProjectURI = 'https://github.com/StartAutomating/Posh'
            LicenseURI = 'https://github.com/StartAutomating/Posh/blob/main/LICENSE'
            IconURI    = 'https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Posh.png'
            Tags = 'Posh', '.ps1xml', 'Format','Output','Types', 'Colorized', 'Prompt', 'Customization'
            ReleaseNotes = @'
## Posh 0.2: Posh.NET:

Added Posh.Net Psuedotype (#282)

This makes .NET types easier to explore in Posh

For example:

~~~PowerShell
$Posh.NET.Assembly # Get all assemblies
$Posh.NET.Type # Get all types
$Posh.Net.Generic # Get all generic types
$Posh.Net.Attribute # Get all attributes
~~~

For a full list of everything you can do, run:

~~~PowerShell
$Posh.Net | Get-Member
~~~

---

More History in [CHANGELOG](https://github.com/StartAutomating/Posh/blob/main/CHANGELOG.md)

Like It?  Star It!  Love It?  Support It!
'@
        }
        FileTypes = @{
            "Posh.Prompt" = @{
                Pattern = '(?>^prompt|\.prompt\.ps1$)'
                Description = "A function that defines a prompt"
            }
            "Posh.Prompt.Widget" = @{
                Pattern = '(?>^prompt\.widget|\.prompt\.widget\.ps1$)'
                Description = "A function that defines a prompt widget"
            }
            "Posh.Preset" = @{
                Pattern = '\.(?>PowerShell|Posh)\.Preset\.(?>psd1|json|clixml)$'
                Description = "A data file that defines a PowerShell preset."
            }
            "Posh.Tip" = @{
                Pattern = '
                (?:\.(?>PowerShell|Posh))?  # Optional Posh or PowerShell
                \.(?>Tips?|Tricks?|Trivia)  # dot followed by Tip(s), Tricks(s), or Trivia
                (?:\.(?>psd1|ps1|txt|md|json|clixml)$)  # match the extension
                '
            }
        }

        Recommends = "EZOut", "PipeScript", "HelpOut", "PSSVG", "Splatter", "ShowDemo"

        Links = @{
            'PowerShell Guide'    = 'https://PowerShellGuide.com/'
            'PowerShell.Org'      = 'https://powershell.org/'
            'PowerShell Discord'  = 'https://discord.com/invite/powershell'
            'PowerShell Podcast'  = 'https://powershellpodcast.podbean.com/'
            'PowerShell Project'  = 'https://github.com/PowerShell/PowerShell'    
            'PowerShell GitHub'   = 'https://github.com/topics/powershell'
            'PowerShell Twitter'  = 'https://twitter.com/search?q=%23PowerShell'
            'PowerShell Facebook' = 'https://www.facebook.com/groups/powershell/'
            'PowerShell LinkedIn' = 'https://www.linkedin.com/feed/hashtag/?keywords=powershell'    
        }

        Video = @{
            "Improving the Shell Experience (from RTPSUG)" = "https://www.youtube.com/watch?v=iZgcTD_uN-w"
        }

        Taglines = 
            "PowerShell made Posh",
            "Spice up your Shell",
            "Add some color to your console",
            "PowerShell made pretty",
            "Fancy Formatting for your Shell"

        News = 
            @{"PowerShell Blog" = "https://devblogs.microsoft.com/powershell/feed/"},
            @{"PowerShell Podcast"="https://feed.podbean.com/powershellpodcast/feed.xml"}, 
            @{"Evotec"="https://evotec.xyz/feed/"},
            @{"DBATools"="https://dbatools.io/feed/"},            
            @{"The Lazy Admin" = "https://lazyadmin.nl/feed/"}, 
            @{"The Command Line Ninja" = "https://www.commandline.ninja/rss/"},
            @{"PowerShell Geek"="https://www.powershellgeek.com/feed/"},
            @{"PowerShell District" = "http://www.powershelldistrict.com/feed"}, 
            @{"Adam the Automator"="https://adamtheautomator.com/feed/"},
            @{"The Lonely Administrator" = "https://jdhitsolutions.com/blog/feed/"},
            @{"MDGRS Factory"="https://mdgrs.hashnode.dev/rss.xml"},
            @{"Pipe How"="https://pipe.how/index.xml"},
            @{"PowerShell is Fun"="https://powershellisfun.com/feed/"},
            @{"PowerShell Weekly"="https://psweekly.dowst.dev/feed/"},
            @{"Stefan Stranger"="https://stefanstranger.github.io/feed"},
            @{"Christian Ritter"="https://devdojo.com/feed/hcritter"}

        # Got more News?  Feel free to file an issue and open a PR to add your feed.

        # Any module can contain it's own .News.
        # If Posh and that module are loaded, your module will have .News/.Feed/.RSS properties.
            
        Screenshot = @{
            "Improved-File-Formatting" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Improved-File-Formatting.gif"
            "Get-Command-In-Color" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Get-Command-In-Color.gif"
            "Get-Member-In-Color" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Get-Member-In-Color.gif"
            "Reflection-Formatting" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Reflection-Formatting.gif"
            "Regex-In-Color" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Regex-In-Color.gif"
            "XML-In-Color" = "https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/XML-In-Color.gif"
        }, @{
            "Logo" = 'https://raw.githubusercontent.com/StartAutomating/Posh/main/Assets/Posh.png'
        }

        ExtendedDescription = "      
        Posh is a PowerShell module that improves the shell experience.
        
        It :
        
           * Helps you to customize the shell.
           * Helps you learn PowerShell
           * Improves built-in formatting
           * Extends built-in types           
        "
    }

}
