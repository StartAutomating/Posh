<#
.SYNOPSIS
    Adds content to a profile
.DESCRIPTION
    Adds content to a PowerShell profile
#>
param(
# The content to add to your profile.
[ScriptBlock]
$Content,

# Which profile should the content be added to?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string]
$WhichProfile = 'CurrentUserCurrentHost'
)

$profilePath = $PROFILE.$WhichProfile

$profileContent = 
    if (Test-Path $profilePath) {
        Get-Content -Raw $profilePath 
    } else {
        ''
    }

if ($profileContent -like "*$Content*") {
    return
}

$profileContent += [Environment]::NewLine
$profileContent += "$content"
$profileContent | Set-Content -Path $profilePath -PassThru


