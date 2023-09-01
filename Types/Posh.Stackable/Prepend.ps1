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



$toPrepend = if ($Value -is [ScriptBlock]) {
    $Value
} else {
    [ScriptBlock]::Create($this.Stringify($Value))
}

$currentFunction = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")[0]
$this.Current = {@(. $toPrepend; . $currentFunction) -join ''}.GetNewClosure()