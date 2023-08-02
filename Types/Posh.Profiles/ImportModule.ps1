<#
.SYNOPSIS
    Imports a module in a profile
.DESCRIPTION
    Adds code to import a module in your profile.
    This will ensure the module is loaded whenever you're running PowerShell.
.EXAMPLE
    $Posh.Profile.ImportModule("Posh")
#>
param(
# The name of the module to import.
[string]
$Module,

# Which profile should the content be added to?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string]
$WhichProfile = 'CurrentUserCurrentHost'
)


$AlreadyAdded = $this.Matches("Import-Module $Module", $WhichProfile)
if (-not $AlreadyAdded) {
    $this.Add(
        [scriptblock]::Create("Import-Module $module -Force$([Environment]::Newline)"),
        $WhichProfile
    )
}
