<#
.SYNOPSIS
    Sets the host's title
.DESCRIPTION
    Sets the host's window title.

    Unfortunately, this will be ignored if running in Visual Studio Code.
.EXAMPLE
    $Posh.Title = "Sup?"
#>
param(
[string]
$Title
)
$this.UI.RawUI.WindowTitle = $title
