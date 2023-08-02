<#
.SYNOPSIS
    Gets module demos
.DESCRIPTION
    Gets demo files related to a module.
.EXAMPLE
    $Posh.Demos
.LINK
    https://github.com/StartAutomating/ShowDemo
#>
$this |
    Split-Path |
    Get-ChildItem -Recurse -Filter *.demo.ps1 |
    Select-Object -Unique