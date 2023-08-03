<#
.SYNOPSIS
    Replaces content in a profile
.DESCRIPTION
    Replaces content in a PowerShell profile.
#>
param(
# The content to replace.
# If the content is a regular expression pattern, any matches will be replaced.
# Otherwise, any case-insensitive occurances of the string will be replaced.
$Content,

# The content to replace.
# If content replaced was a regular expression,
# this will be treated as a [Regular Expression substitution](https://learn.microsoft.com/en-us/dotnet/standard/base-types/substitutions-in-regular-expressions).
$Replacement = '',

# Which profile should the content be removed from?
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

if ($Content -is [regex]) {
    $profileContent = $Content.Replace($profileContent, $Replacement)
} else {
    $Content = "$content"
    if ($Content) {
        $profileContent = 
            $profileContent.Replace(
                $content, $Replacement, [StringComparison]::OrdinalIgnoreCase
            )
    }
}

$profileContent | Set-Content -Path $profilePath -PassThru