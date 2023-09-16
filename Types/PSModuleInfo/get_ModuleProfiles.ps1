<#
.SYNOPSIS
    Gets a Module's Profiles
.DESCRIPTION
    Gets the profile files associated with the module.

    Any module can have a file within the same directory any valid $profile location, named `$($this.Name).profile.ps1`.

    This file may be loaded when the module loads, or anytime thereafter.
#>
if (-not $profile) { return @()}
,@(@($profile.psobject.properties | 
        Where-Object MemberType -EQ NoteProperty |
        Select-Object -ExpandProperty Value) -as [io.fileinfo[]] | 
        Split-Path | 
        Select-Object -Unique |
        Where-Object { $_ } | 
        Join-Path -ChildPath "$($this.Name).profile.ps1" |
        Where-Object { $_ | Test-Path } |
        ForEach-Object { $_.FullName })