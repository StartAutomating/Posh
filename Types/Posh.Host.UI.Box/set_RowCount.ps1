<#
.SYNOPSIS
    Sets the number of rows in a box.
.DESCRIPTION
    Sets the number of rows in a Posh.Host.UI.Box object.
#>
param(
[int]$RowCount
)
$this | Add-Member NoteProperty '.RowCount' $RowCount -Force

