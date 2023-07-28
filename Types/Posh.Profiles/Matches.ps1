<#
.SYNOPSIS
    Matches patterns within profiles
.DESCRIPTION
    Matches a pattern within profile files.
    
    All places the pattern is found will be returned.
.EXAMPLE
    $Posh.Profile.Matches("Posh")
#>
param(
[regex]
$Pattern,

# Which profile should the content be removed from?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string[]]
$WhichProfile = 'CurrentUserCurrentHost'
)

@(foreach ($prof in $WhichProfile) {
    if (Test-Path ($profile.$prof)) {
        $pattern.Matches((Get-Content -Raw ($profile.$prof)))
    } 
})