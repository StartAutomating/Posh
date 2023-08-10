<#
.SYNOPSIS
    Sets an extension collection's module
.DESCRIPTION
    Sets the module that defines extended command types in an extension collection.
#>
param(
# The module.
[Management.Automation.PSModuleInfo]
$Module
)

Add-Member -InputObject $this -MemberType NoteProperty -Name '.Module' -Value $module -Force