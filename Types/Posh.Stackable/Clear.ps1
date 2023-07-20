<#
.SYNOPSIS
    Clears a stackable function
.DESCRIPTION
    Clears a stackable function, resetting it to it's original state.
.EXAMPLE
    $Posh.Prompt.Clear()
#>
if ($this.Stack -and $this.Stack.Count) {
    
    $posh.ExecutionContext.SessionState.psvariable.Set("function:$($this.FunctionName)", @($this.Stack.ToArray())[-1])     
    $this.Stack.Clear()
}