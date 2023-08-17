@{
    ModuleVersion = '0.1.4'
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
## Posh 0.1.4: Some Posh News

* Added .News to every module (#173)
* Populated Posh with lots of blogs (#176)

Try $Posh.News after importing.

Also, added tests (#204).

---

## Posh 0.1.3: Posh Tips and Tricks

* New Formatting:
  * Adding Select-XML Formatter (#107)
  * Posh.Preset.Collection (#153)
  * Posh.Tip.Command (#166)
* Updated Formatting:
  * Making DirectoryIcon customizable / changing default to triangle (#169)
  * Integrating Tips/Links into Posh Formatting (#165)
  * Improving Formatting of Select-String (#109) (thanks @mdgrs-mei ! )
* Added Tips and Tricks to Modules (#118) and added the first round of tips/tricks:
  * NegativeIndexingFibonacci Trick (#168)
  * GenericTypes Tip (#167)
  * Ordered Hashtables Tip (#156)
  * Hashtables Tip (#155)
  * AssigningLoopOutput Tip (#145)
  * RangeOperator Tip (#151)
  * NegativeIndex Tip (#150)
  * TernaryOperator Tip (#148)
  * Creating PsuedoObjects Trick (#144)
  * AssigningIfStatements Tip (#144)
  * Tip - Trinity of Discoverability (#142)
  * Tip - You Can Get Help On a Script (#147)
  * Tip - Everything Is An Object (#140)
  * Trick - The Parameter Set That Was Not There (#141)
  * Multiple Assignment Tip (#143)
  * LoopLabels Tip (#146)
  * see issues #166
* New Extended Types:
  * Posh.Preset.Collection (#153)
  * Posh.Preset.Command (#154)
  * Posh.ExtensionCollection
    * .Count (#162)
    * .Refresh() (#123)
    * .Random (#124)
    * .All (#128)
    * get/set .CommandType (#127)
    * get/set .Path (#126)
    * get/set Module (#125)
* Updated Extended Types
  * PSModuleInfo.Link (#64/#157/#158/#159/#160)
  * PSModuleInfo.Preset (#64/#153)
  * PSModuleInfo.Tip(s)/Trick(s) (#119, #120)
  * $Posh.Host.get/set_Title (#130)
  * Fixing stackable functions (#110, thanks @mdgrs-mei !)
* Updating Posh.Preset.Command.Use help (#154)
* Adding FileIcons Preset (#163)
* Making TabExpansion Stackable (#116)

---

## Posh 0.1.2:

* New Demos
    * Posh.demo.ps1 (#95)
    * Posh.Prompt.demo.ps1 (#96)
    * Posh Profile Customization (#97)
* New formatters:
    * Adding Formatting for Match (#100)
    * Adding Variable Formatting (#102)  
* Extending Modules
    * Adding PSModuleInfo.Test(s) (#104)
* Prompt Customization:
    * Posh.Prompt.Undo() (#103)
* Profile Customization:
    * Posh.Profiles.RemoveModule (#105)
    * Posh.Profiles.New() (#101)
    * Posh.Profile.ImportModule (#93)
    * Posh.Profile.Matches (#99)
    * Posh.Profile.Replace (#92)
    * Posh.Profile.get_File (#76)

---

## Posh 0.1.1:

* Posh can be sponsored (please show your support) (#77)
* Added $Posh.Recommends (#65)
* Added LinkedIn to $Posh.Resources (#66)
* Added Logo (#67)
* Expanding $Posh.Parameters (#68)
* Adding LocalTime to TimeZone formatting (#84, #85)
* $LastOutput/$LastOutputError (#74)
* Adding $profile.Directory (#75)
* Expanding PSModuleInfo
  * Recommendations (#65) 
  * Screenshots (#79)
  * Videos (#80)
  * Demos (#81)
  * Logo (#89)

---

## Posh 0.1:

* Initial Version of Posh, including:
  * Customizable prompts
  * Easier access to PowerShell Error history  
* Formatting:
  * Reflection formatter
  * Get-Member in Color
  * Colorized XML
  * Colorized File View (with Icons!) (no NerdFonts required)
  * Colorized Regex
  * Process HeatMap
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
            'PowerShell Project'  = 'https://github.com/PowerShell/PowerShell'    
            'PowerShell GitHub'   = 'https://github.com/topics/powershell'
            'PowerShell Twitter'  = 'https://twitter.com/search?q=%23PowerShell'
            'PowerShell Facebook' = 'https://www.facebook.com/groups/powershell/'
            'PowerShell LinkedIn' = 'https://www.linkedin.com/feed/hashtag/?keywords=powershell'    
        }

        News = 
            @{"PowerShell Blog" = "https://devblogs.microsoft.com/powershell/feed/"}, 
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
            @{"PowerShell is Fun"="https://powershellisfun.com/feed/"}

        # Got more News?  Feel free to file and issue and open a PR to add your feed.

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
