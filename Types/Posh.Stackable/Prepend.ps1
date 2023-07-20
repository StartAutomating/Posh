<#
.SYNOPSIS
    Prepends content to a stackable function.
.DESCRIPTION
    Prepends content to a stackable function.

    This takes the current entry and adds content to it's beginning.
#>
param(
# The value to prepend.
$Value
)



$toPrepend = $this.Stringify($prompt)
$currentFunction = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")
$this.Current = "@(. { $toPrepend} ; . { $currentFunction }) -join ''" 