<#
.SYNOPSIS
    Sets the number of columns in a box.
.DESCRIPTION
    Sets the number of columns in a Posh.Host.UI.Box object.
#>
param(
[int]$ColumnCount
)
$this | Add-Member NoteProperty '.ColumnCount' $ColumnCount -Force

