<#
.SYNOPSIS
    Gets the value of a stackable function
.DESCRIPTION
    Gets the current value of a stackable function.
.EXAMPLE
    $posh.Prompt.Current
#>
$posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")