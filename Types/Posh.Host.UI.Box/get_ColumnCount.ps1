<#
.SYNOPSIS
    Gets the number of columns in a box.
.DESCRIPTION
    Gets the number of columns in a Posh.Host.UI.Box object.
.NOTES
    This script checks if the '.ColumnCount' property is null and adds it as a NoteProperty with a default value of 0 if it is.
    It then returns the value of the '.ColumnCount' property.
#>
if ($null -eq $this.'.ColumnCount') {
    $this | Add-Member NoteProperty '.ColumnCount' 0 -Force
}
$this.'.ColumnCount'
