<#
.SYNOPSIS
    Replaces content within a function
.DESCRIPTION
    Replaces content within a stackable function, such as the prompt.
.EXAMPLE
    # Replace both ends of the prompt
    $Posh.Prompt.Replace('PS ', 0x27d6,$true).Replace('>', 0x27d5, $true)
.EXAMPLE
    $Posh.Prompt.Replace($(
        if ($env:User) {
            $env:User
        } elseif ($env:UserName) {
            $env:UserName
        }
    ),'***')
#>
param(
# The content to replace
$Replace,

# The new value
$Value
)


$toReplace = if ($Value -is [ScriptBlock]) {
    "{$Value}"
} else {
    $this.Stringify($Value)
}

$currentFunction = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")

$replaceRegex = "[Regex]::new('$($Replace -replace "'","''")','IgnoreCase,IgnorePatternWhitespace','00:00:02')"
$passThru = $false
foreach ($arg in $args) {
    if ($arg -is [bool] -and $arg) {
        $passThru = $true
    }
}
$newFunc = "@(
    `$existingOutput =. { $currentFunction };
    `$replacePattern = $replaceRegex
    `$replaceWith = $toReplace 
    `$replacePattern.Replace(`$existingOutput, `$replaceWith)
) -join ''" 


$this.Current = $newFunc
if ($passThru) {
    $this
}