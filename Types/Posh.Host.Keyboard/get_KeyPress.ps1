<#
.SYNOPSIS
    Gets the current KeyPress
.DESCRIPTION
    Gets the currently pressed key
.EXAMPLE
    $Posh.Host.Keyboard.KeyPress # Will almost always be enter, because you just ran it
#>
while ($host.UI.RawUI.KeyAvailable) { 
    $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown,IncludeKeyUp')
}