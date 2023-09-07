<#
.SYNOPSIS
    Gets the cursor position
.DESCRIPTION
    Gets the cursor position
.EXAMPLE
    $Host.Cursor.Position
#>

if ($host.UI.RawUI.CursorPosition) {
    # In the "really" category, CursorPosition is zero-index, where as actual cursors in a terminal are 1-indexed.
    [PSCustomObject][Ordered]@{
        PSTypeName = 'Posh.Host.Cursor.Position'
        Row    = ($host.UI.RawUI.CursorPosition.Y + 1)
        Column = ($host.UI.RawUI.CursorPosition.X + 1)
    }
}
