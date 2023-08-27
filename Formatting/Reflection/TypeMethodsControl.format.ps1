$getStaticMethods = {
    if ($_ -is [Type]) {
        $_.GetMethods('Static,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetMethods("Static,$($_.BindingFlags)")
    }
}

$getInstanceMethods = {
    if ($_ -is [Type]) {
        $_.GetMethods('Instance,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetMethods("Instance,$($_.BindingFlags)")
    }
}

Write-FormatControl -Name TypeMethodsControl -Action {
    Write-FormatViewExpression -If $getStaticMethods -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Static Methods:'           
    }
    Write-FormatViewExpression -If $getStaticMethods -ScriptBlock $getStaticMethods -Enumerate -ControlName TypeMethodControl
    Write-FormatViewExpression -If $getInstanceMethods -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Methods:'           
    }
    Write-FormatViewExpression -If $getInstanceMethods -ScriptBlock $getInstanceMethods -Enumerate -ControlName TypeMethodControl
}