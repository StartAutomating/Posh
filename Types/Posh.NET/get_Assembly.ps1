<#
.SYNOPSIS
    Gets loaded assemblies
.DESCRIPTION
    Gets the currently loaded assemblies.
.EXAMPLE
    $Posh.Net.Assembly
.EXAMPLE
    $Posh.Net.Assemblies
#>
[AppDomain]::CurrentDomain.GetAssemblies()