<#
.SYNOPSIS
    Appends content to a stackable function
.DESCRIPTION

#>
param(
# The value to prepend.
$Value
)

$ToAppend = $this.Stringify($Value)
$currentFunction = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")
$this.Current = "@(. { $currentFunction }; . { $toAppend}) -join ''" 