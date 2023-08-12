#1. Welcome to Posh

#.Silent Clear-Host

# Posh improves the PowerShell experience.

# It enhances PowerShell formatting, and makes the shell easier to script.

# For a simple example, just echo the variable $Posh

$Posh

# Let's take a quick tour of some of the ways Posh makes PowerShell cooler.

#2. Enhanced Formatting

#.Silent Clear-Host

#2.1. File Colorization and Icons

# Posh shows files in color with (hopefully) helpful icons and clickable links.

Get-Module Posh |
    Split-Path |
    Get-ChildItem

# Posh's icons do not require NerdFonts, and will be ignored in favor of Terminal-Icons, if that's what you prefer.

#.Silent Clear-Host

#2.2  Get-Command in Color

# Posh also updates the formatter for Get-Command.

# It slims the output to just the Name and the Module,
# and colorizes the Name based off the verb.

Get-Command -Module Microsoft.PowerShell.*

#.Silent Clear-Host

#2.3. Get-Member in Color

# Get-Member is one of the three most useful commands in PowerShell

# Posh lets you see it in color:

Get-Command | Get-Member

#.Silent Clear-Host

#2.4 Reflection formatting

# Posh also makes it easy to explore reflection.

# Just pipe a type to Format-Custom.


[int] | Format-Custom

# By default, this only shows you short set of information about just that type.

# To see _everything_ about an object, use something like

[int] | Format-Custom -View System.Type.Full


# This also works for generic types.

[Collections.Generic.Dictionary[string, PSObject]] | 
    Format-Custom -View System.Type.Full

#2.5 Colorized XML

#.Silent Clear-Host

# Posh also makes XML more colorful in the console.

Invoke-RestMethod https://pssvg.start-automating.com/Examples/HelloWorld.svg

#2.6 Colorized Regular Expressions

#.Silent Clear-Host

# Regular Expressions are also syntax highlighted, helping us all hopefully understand them better.

[Regex]::new('
(?<NameOfCapture>Pattern) # Comment
','IgnoreCase,IgnorePatternWhitespace')


#2.7 Get-Process heatmap

# Posh also makes the formatter for Get-Process show a heatmap of various properties.

Get-Process -id $pid

#2.8 TimeSpans and TimeZones

#.Silent Clear-Host

# Posh also simplifies the display for TimeZones and Timespans

New-TimeSpan -Hours 24 -Minutes 30 -Seconds 15

# We can also display timespans in their ISO format!

New-TimeSpan -Hours 24 -Minutes 30 -Seconds 15 |
    Format-Custom -View ISO-8601


# TimeZones also get more readable by trimming the number of displayed properties.

Get-TimeZone

# We only show the ID and DisplayName.

# We also add a .LocalTime for ease of use.

# This makes a simple PowerShell command console World Clock.

Get-TimeZone -ListAvailable


