#1. Customizing Profiles

# Profiles are a useful part of PowerShell.

# They run when PowerShell starts.

# Posh makes profiles easy to explore and modify

$Posh.Profile

# Let's pipe it into Get-Member and see what it can do:

$Posh.Profile | Get-Member

# We can get all the current profile file, by using

$Posh.Profile.File

# We can also get all current profile files, by using

$Posh.Profile.Files

# If we want to import a module in our profile, we can use

$Posh.Profile.ImportModule("Posh")

# If we want to add arbitrary code to our profile, we can use:

$Posh.Profile.Add({
    "Welcome to PowerShell!" | Out-Host
})
