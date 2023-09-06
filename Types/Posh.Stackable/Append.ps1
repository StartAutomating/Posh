<#
.SYNOPSIS
    Appends content to a stackable function
.DESCRIPTION

#>
param(
# The value to prepend.
$Value
)

$toAppend = if ($Value -is [ScriptBlock]) {
    $Value
} else {
    [ScriptBlock]::Create($this.Stringify($Value))
}

$currentFunction = $posh.ExecutionContext.SessionState.InvokeCommand.InvokeScript("`$function:$($this.FunctionName)")[0]
$this.Current = {@(. $currentFunction; . $toAppend) -join ''}.GetNewClosure()