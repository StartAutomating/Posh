<#
.SYNOPSIS
    Gets Error History
.DESCRIPTION
    Gets the history items associated with PowerShell Errors
.EXAMPLE
    $Error.History
#>
$historyIDS = @(foreach ($err in $this) {
    if ($err.InvocationInfo.HistoryId -gt 0) {
        $err.InvocationInfo.HistoryId
    }
})

Get-History -Id $historyIDS