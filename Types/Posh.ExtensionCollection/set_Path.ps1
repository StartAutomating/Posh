<#
.SYNOPSIS
    Sets an extension collection's path
.DESCRIPTION
    Sets the path that defines extended command types in an extension collection.
#>
param(
# The path.  If this is empty, only extensions that are functions or aliases will be found.
[string[]]
$Path
)

Add-Member -InputObject $this -MemberType NoteProperty -Name '.Path' -Value $Path -Force