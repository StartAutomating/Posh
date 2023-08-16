<div align='center'>
<img src='assets/Posh.svg' alt='posh' />
<a href='https://www.powershellgallery.com/packages/posh/'>
<img src='https://img.shields.io/powershellgallery/dt/posh' />
</a>
<br/>
<a href='https://github.com/sponsors/StartAutomating'>❤️</a>
<a href='https://github.com/StartAutomating/posh/stargazers'>⭐</a>
</div>

Posh is a PowerShell module that makes PowerShell more fun to work with.

## Improving Formatting

Posh provides PowerShell formatting for all sorts of fun scenarios, like:

### Get-Command in color

Posh colorizes commands by verb.

~~~PowerShell
Get-Command
~~~

![Get-Command-In-Color](Assets/Get-Command-In-Color.gif)

### Get-Member in color

~~~PowerShell
Get-Command | Get-Member 
~~~

![Get-Member-In-Color](Assets/Get-Member-In-Color.gif)

### Reflection Formatter

Posh provides a formatter for reflection, to help you explore types.

~~~PowerShell
[int] | Format-Custom
~~~

~~~PowerShell
[int] | Format-Custom -View System.Type.Full
~~~

It even works on generic types

~~~PowerShell
[Collections.Generic.Dictionary[string, PSObject]] | 
    Format-Custom -View System.Type.Full
~~~

![Reflection-Formatting](Assets/Reflection-Formatting.gif)

### Colorized XML

~~~PowerShell
[xml]"<a><b attr='c'/></a>"
~~~

![XML-In-Color](Assets/XML-In-Color.gif)

## How Posh Works

Posh is a somewhat unique PowerShell module in that it does not export commands.

Posh _only_ extends the types and formatting in PowerShell.

It is built using:

* [EZOut](https://github.com/StartAutomating/EZOut)
* [PipeScript](https://github.com/StartAutomating/PipeScript)
* [HelpOut](https://github.com/StartAutomating/HelpOut)
