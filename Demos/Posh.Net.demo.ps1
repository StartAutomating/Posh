# Posh makes it easier to explore the .NET framework
$posh.Net

# Let's pipe $Posh.NET into Get-Member to get a sense of what we can do.
$Posh.Net | Get-Member

# .NET types are stored in assemblies
# You can get all loaded assemblies with:
$Posh.NET.Assemblies

# Each .NET type could help you solve a problem.
# Posh, how many types are currently loaded?
$posh.NET.Types.Count

# Some types represent a set of options.
# These are called "Enums" in most languages.
# How many enums are currently loaded?
$Posh.NET.Enums.Count

# If you pipe an Enum into Get-Member -Static, it will show the values.
# Let's have some fun with this, and see if we can find every possible state of PowerShell
$Posh.NET.Enums |
    Where-Object IsPublic | # they have to be public types
    Where-Object Name -like '*state' | # named like *state
    Where-Object Assembly -eq ([PSObject].Assembly) | # and in the PowerShell assembly    
    Get-Member -Static # (pipe that all to Get-Member)

# A .NET Interface describes how an object should work.
# How many interfaces are loaded?
$Posh.NET.Interfaces.Count

# Let's look for all interfaces that have a `Clone()` method.
$Posh.NET.Interfaces |
    Where-Object { $_.GetMethod("Clone") }

# Hopefully, you're getting the idea.

# Every major part of .NET is exposed in a simple syntax in Posh.

# Enjoy!


