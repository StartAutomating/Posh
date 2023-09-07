<#
.SYNOPSIS
    Gets the cursor
.DESCRIPTION
    Gets the console cursor.
.EXAMPLE
    $Host.Cursor
.EXAMPLE
    $Posh.Host.Cursor
.EXAMPLE
    $Posh.Cursor.Position
#>
return ([PSCustomObject]@{PSTypeName='Posh.Host.Cursor'})