<#
.SYNOPSIS
    Creates a new profile
.DESCRIPTION
    Creates a new profile, or returns an existing profile.
.EXAMPLE
    $Posh.Profile.New()
#>
param(
# Which profile should be created?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string]
$WhichProfile = 'CurrentUserCurrentHost'
)

$profilePath = $PROFILE.$WhichProfile

if (Test-Path -LiteralPath $profilePath) {
    Get-Item -LiteralPath $profilePath
} else {
    New-Item -ItemType File -Path $profilePath -Force
}