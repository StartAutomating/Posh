<#
.SYNOPSIS
    Removes content from a profile
.DESCRIPTION
    Removes content from a PowerShell profile.
#>
param(
# The content to remove.
# If the content is a regular expression pattern, any matches will be removed.
# Otherwise, any case-insensitive occurances of the string will be removed.
$Content,

# Which profile should the content be removed from?
# The default is the current user's current host.
[ValidateSet('AllUsersAllHosts','AllUsersCurrentHosts','CurrentUserAllHosts','CurrentUserCurrentHost')]
[string]
$WhichProfile = 'CurrentUserCurrentHost'
)

$this.Replace($Content, '', $WhichProfile)