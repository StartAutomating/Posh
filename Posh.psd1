@{
    ModuleVersion = '0.1.2'
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
                (?:\.(?>PowerShell|Posh))? # Optional Posh or PowerShell
                \.(?>Tips?|Trivia)         # dot followed by Tip(s), or Trivia
                (?:\.(?>psd1|ps1|txt)$)?   # PSD1 and PS1 files are acceptable (extension is optional)
                '
            }
            "Posh.Trick" = @{
                Pattern = '
                (?:\.(?>PowerShell|Posh))? # Optional Posh or PowerShell
                \.(?>Example|Tricks?)      # dot followed by Example, Trick, or Tricks
                \.(?>psd1|ps1)$            # PSD1 and PS1 files are acceptable
                '
            }
        }

        Recommends = "EZOut", "PipeScript", "HelpOut", "PSSVG", "Splatter", "ShowDemo"

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
           * Improves built-in formatting
           * Extends built-in types
           * Helps you learn PowerShell
        "
    }

}
