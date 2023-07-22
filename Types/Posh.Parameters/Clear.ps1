<#
.SYNOPSIS
    Clears default parameter values.
.DESCRIPTION
    Clears all default parameter values.
.EXAMPLE
    $posh.Parameters.Clear()
#>
$global:PSDefaultParameterValues.Clear()