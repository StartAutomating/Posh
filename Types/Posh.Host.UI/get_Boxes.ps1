<#
.SYNOPSIS
    Gets a collection of boxes
.DESCRIPTION
    Gets a collection of box shapes that can be used to render a user interface.
.EXAMPLE
    $Posh.Host.UI.Boxes
#>
if (-not $this.'.Boxes') {
    Add-Member -InputObject $this -MemberType NoteProperty -Name '.Boxes' -Value (
        [PSCustomObject]@{PSTypeName='Posh.Host.UI.Boxes'}
    ) -Force
}
$this.'.Boxes'