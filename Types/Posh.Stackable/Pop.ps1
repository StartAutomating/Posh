<#
.SYNOPSIS
    Pops the last value from a function stack
.DESCRIPTION
    Pops the latest value from a function stack, such as the prompt.
.EXAMPLE
    $Posh.Prompt.Pop()
#>
param(
  
)

if ($this.Stack -and $this.Stack.Count) {
    $posh.ExecutionContext.SessionState.psvariable.Set("function:$($this.FunctionName)", $this.Stack.Pop()) 
}