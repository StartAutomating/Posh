<#
.SYNOPSIS
    Gets the profile file
.DESCRIPTION
    Gets the profile file for the current user in the current host.
.EXAMPLE
    $Posh.Profile.File    
#>
if (Test-Path "$profile") {
    Get-Item -LiteralPath "$profile"
}