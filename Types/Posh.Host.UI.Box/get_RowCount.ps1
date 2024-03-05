<#
.SYNOPSIS
    Gets the number of rows in a box.
.DESCRIPTION
    Gets the number of rows in a Posh.Host.UI.Box object.
#>

if ($null -eq $this.'.RowCount') {
    $this | Add-Member NoteProperty '.RowCount' 0 -Force
}
$this.'.RowCount'
