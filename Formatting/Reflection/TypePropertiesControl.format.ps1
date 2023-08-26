$getStaticProperties = {
    if ($_ -is [Type]) {
        $_.GetProperties('Static,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetProperties("Static,$($_.BindingFlags)")
    }
}

$getInstanceProperties = {
    if ($_ -is [Type]) {
        $_.GetProperties('Instance,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetProperties("Instance,$($_.BindingFlags)")
    }
}

Write-FormatControl -Name TypePropertiesControl -Action {
    Write-FormatViewExpression -If $getStaticProperties -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Static Properties:'           
    }
    Write-FormatViewExpression -If $getStaticProperties -ScriptBlock $getStaticProperties -Enumerate -ControlName TypePropertyControl
    Write-FormatViewExpression -If $getInstanceProperties -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Properties:'           
    }
    Write-FormatViewExpression -If $getInstanceProperties -ScriptBlock $getInstanceProperties -Enumerate -ControlName TypePropertyControl
}