<#
.SYNOPSIS
    Gets module tests
.DESCRIPTION
    Gets Pester Tests located within a module.
#>
$this |
    Split-Path |
    Get-ChildItem -Recurse -Filter *.tests.ps1 |
    Select-Object -Unique