<#
.SYNOPSIS
    Gets module presentations
.DESCRIPTION
    Gets PowerPoint presentations and templates located within a PowerShell module.
#>
$this |
    Split-Path |
    Get-ChildItem -Recurse |
    Where-Object Extension -In '.pptx', '.potx','.ppt' |
    Select-Object -Unique