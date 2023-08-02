<#
.SYNOPSIS
    Remove a module from a profile
.DESCRIPTION
    Remove code that imports a module in your profile.
.EXAMPLE
    $Posh.Profile.RemoveModule("Posh")
#>
param(    
# The name of the module to no longer import.
[string]
$Module,    

# Which profile should the content be added to?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string]
$WhichProfile = 'CurrentUserCurrentHost'
)


$AlreadyAdded = $this.Matches("Import-Module $Module", $WhichProfile)
if ($AlreadyAdded) {
    $this.Remove("Import-Module $Module", $WhichProfile)
}
