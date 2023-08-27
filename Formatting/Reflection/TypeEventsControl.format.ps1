$getEvents = {
    if ($_ -is [Type]) {
        $_.GetEvents('Instance,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetEvents($_.BindingFlags)
    }
}

Write-FormatControl -Name TypeEventsControl -Action {
    Write-FormatViewExpression -If $getEvents -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Events:'
    }
    Write-FormatViewExpression -If $getEvents -ScriptBlock $getEvents -Enumerate -ControlName TypeEventControl
}