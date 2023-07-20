<#
.SYNOPSIS
    Converts into a stringified value
.DESCRIPTION
    Converts an item into a stringified value.

    This is used internally by stackable functions when they are prepending or appending.
#>
param(
$Prompt
)



if ($Prompt -is [ScriptBlock]) {
    ". {$prompt}"
} else {
    "'$(
        $(
    if ($Prompt -is [int]) {
        if ($Prompt -le 1000) {
            $Prompt -as [char] -as [string]
        } else {
            $ExecutionContext.SessionState.InvokeCommand.ExpandString('`u{'+("{0:x}" -f $Prompt)  + '}')
        }
    } else {
        $Prompt
    }
        ) -replace "'","''"
    )'"
}