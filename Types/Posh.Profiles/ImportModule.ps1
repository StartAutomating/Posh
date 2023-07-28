<#
#>
param(    
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
        [scriptblock]::Create("Import-Module $module -Force"),
        $WhichProfile
    )
}
