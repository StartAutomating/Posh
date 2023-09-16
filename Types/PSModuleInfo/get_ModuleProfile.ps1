<#
.SYNOPSIS
    Gets a Module's Profile
.DESCRIPTION
    Gets the profile file associated with the module.

    Any module can have a file within the same directory as $profile, named `$($this.Name).profile.ps1`.

    This file may be loaded when the module loads, or anytime thereafter.
#>
if (-not $profile) { return ''}
($profile | 
    Split-Path | 
    Join-Path -ChildPath "$($this.Name).profile.ps1"
).ToString()