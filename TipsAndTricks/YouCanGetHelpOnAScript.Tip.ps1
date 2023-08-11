# Get-Help isn't just got commands.

# You can Get-Help on any Script, too.

$scriptPath =
    Get-Module Posh | 
    Split-Path |
    Join-Path -ChildPath "Types" |
    Join-Path -ChildPath "PSModuleInfo" | 
    Join-Path -ChildPath "get_Tip.ps1"

Get-Help $scriptPath
 