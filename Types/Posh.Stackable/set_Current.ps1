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
$currentFunctionValue = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")[0]
$this.Stack.Push(
$currentFunctionValue
)
$newFunctionValue = $args[0]
if ($newFunctionValue -isnot [ScriptBlock]) {
    $newFunctionValue = [ScriptBlock]::Create($this.Stringify($newFunctionValue))
}
$posh.ExecutionContext.SessionState.PSVariable.Set("function:$($this.FunctionName)", $newFunctionValue)