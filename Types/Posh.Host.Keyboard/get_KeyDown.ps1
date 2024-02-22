<#
.SYNOPSIS
    Gets the current KeyDown
.DESCRIPTION
    Gets the current KeyDown
.EXAMPLE
    $Posh.Host.Keyboard.KeyDown # Will almost always be enter, because you just ran it
#>
while ($host.UI.RawUI.KeyAvailable) { 
    $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}