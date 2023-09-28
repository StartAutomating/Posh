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

## Posh 0.1.9: Posh Community

* New Blog: Christian Ritter ( thanks @HCRitter ! )

* Additions to all community modules (when Posh is also loaded)
  * PSModuleInfo.Presentation (#262)
  * Module Profiles (#273)
  * Installable Recommendations (#233)

* Posh now runs any .ModuleProfiles at the end of it's import (#164)

* Integrated [PSA](https://github.com/StartAutomating/PSA) for automated annoucements on BlueSky.

---

## Posh 0.1.8: Posh Formatting

* New Formatting:
  * Get-Service shows up in color! (#265)
  * Get-Event gets a table formatter (and .EventID, .SourceID, .Time) (#268)
  * Get-FileHash groups by algorithm and autosizes (#270)
* Improving Formatting:
  * Get-Command now shows Source, not Module (#266) ( thanks @ehmiiz ! )
  * Improving Enclosure Support in Links (#272)

---

## Posh 0.1.7: Posh Presentation

* New and Improved Formatting:
  * Get-Member formatting - Highlighting PowerShell Members (#226)
  * Adding Formatting for PSMemberInfo (#246)
  * Adding Formatting for MeasureInfo (#247)
* New Blogs
  * PowerShell Weekly (#255)
* Host Improvements
  * Adding Posh.Host.Cursor (#134, #135, #243, #244, #245, #248, #249, #250, #251, #252, #253, #259, #261)
* Prompt Improvements
  * Improving stackable functions (#138) (thanks @mdgrs !)
  * Posh.Prompt Tests (#256)
* Adding PSModuleInfo.get_README (#263)

---

## Posh 0.1.6: Posh Reflection 

* Added multiple custom views for System.Type (#216):
  * Can now view 'Inheritance', 'Interfaces', 'Public', 'Private', 'Full'
  * Private methods are highlighted in red.
* New Formatting:
  * System.Version (#230, #231, #232)
* New Methods:
  * Adding Posh.Host.Choose (#131)
* Improving formatting for RSS Feeds (#238)
* Adding PowerShell Podcast to .News/.Links (#228)

---

## Posh 0.1.5: Posh Issues and Discussions

* Adding PSModuleInfo.Discussion (Fixes #212)
* Adding PSModuleInfo.Issue (Fixes #137)
* Improving Issue Templates
* Adding Stefan Stanger's Blog to $Posh.News (#209) (thanks @stefanstranger !)
* Adding RTPSUG Video to Posh (#213) (`$posh.Video`)

---

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
