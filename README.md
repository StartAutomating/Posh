Posh is a PowerShell module that makes PowerShell more fun to work with.

## Improving Formatting

Posh provides PowerShell formatting for all sorts of fun scenarios, like:

### Get-Member in color

~~~PowerShell
Get-Item $pwd | Get-Member 
~~~

### Reflection Formatter

~~~PowerShell
[type] | Format-Custom
~~~

~~~PowerShell
[type] | Format-Custom -View System.Type.Full
~~~

### Colorized XML

~~~PowerShell
[xml]"<a><b attr='c'/></a>"
~~~


## How Posh Works

Posh is a somewhat unique PowerShell module in that it does not export commands.

Posh _only_ extends the types and formatting in PowerShell.

It is built using:

* [EZOut](https://github.com/StartAutomating/EZOut)
* [PipeScript](https://github.com/StartAutomating/PipeScript)
* [HelpOut](https://github.com/StartAutomating/HelpOut)
