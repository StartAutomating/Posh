<#
.SYNOPSIS
    Gets the profile directory
.DESCRIPTION
    Gets the PowerShell profile's directory.
.NOTES
    The Profile Directory is a wonderful place to store data.
    ( It is almost always writeable )
.EXAMPLE
    $Profile.Directory
#>
($profile | Split-Path) -as [IO.DirectoryInfo]