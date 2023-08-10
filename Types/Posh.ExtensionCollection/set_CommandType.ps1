<#
.SYNOPSIS
    Sets an extension collection's command type
.DESCRIPTION
    Sets the extended command types in an extension collection.
#>
param(
# The path.  If this is empty all extended commands will be present in the collection
[string[]]
$CommandType
)

Add-Member -InputObject $this -MemberType NoteProperty -Name '.CommandType' -Value $CommandType -Force