<#
.SYNOPSIS
    Sets the current implementation of a function
.DESCRIPTION
    Sets the current imlementation of a stackable function.

    Stackable functions keep a stack of all prior entries for easy undo.
.EXAMPLE
    $Posh.Prompt.Current = {"?"}
#>
if (-not $this.FunctionName) { return }
$currentFunctionValue = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")
$this.Stack.Push(
$currentFunctionValue
)
$posh.ExecutionContext.SessionState.PSVariable.Set("function:$($this.FunctionName)", "$args")