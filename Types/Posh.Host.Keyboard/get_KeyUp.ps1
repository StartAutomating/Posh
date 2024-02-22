<#
.SYNOPSIS
    Gets the current KeyUp
.DESCRIPTION
    Gets the current KeyUp event
.EXAMPLE
    $Posh.Host.Keyboard.KeyUp # Will almost always be enter, because you just ran it
#>
while ($host.UI.RawUI.KeyAvailable) { 
    $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp')
} 