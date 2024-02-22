<#
.SYNOPSIS
    Gets the cursor
.DESCRIPTION
    Gets the console cursor.
.EXAMPLE
    $Host.UI.Cursor
.EXAMPLE
    $Posh.Host.UI.Cursor
.EXAMPLE
    $Posh.Host.UI.Cursor.Position
#>
return ([PSCustomObject]@{PSTypeName='Posh.Host.Cursor'})