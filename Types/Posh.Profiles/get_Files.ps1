<#
.SYNOPSIS
    Gets the profile files
.DESCRIPTION
    Gets the FileInfo objects for each profile that exists.
.EXAMPLE
    $posh.Profile.Files
#>
foreach ($potentialPath in $profile.CurrentUserCurrentHost, $profile.CurrentUserAllHosts, $profile.AllUsersAllHosts, $profile.AllUsersCurrentHost) {
    if ([IO.File]::Exists($potentialPath)) {
        [IO.FileInfo]$potentialPath
    }
}