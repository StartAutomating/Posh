$getConstructors = {
    if ($_ -is [Type]) {
        $_.GetConstructors('Instance,Public')
    } elseif ($_.Type -and $_.BindingFlags) {
        $_.Type.GetConstructors($_.BindingFlags)
    }
}
Write-FormatControl -Name TypeConstructorsControl -Action {
    Write-FormatViewExpression -If $getConstructors -ScriptBlock { 
        [Environment]::NewLine + ('#' * 3) + ' Constructors:'           
    }
    Write-FormatViewExpression -If $getConstructors -ScriptBlock $getConstructors -Enumerate -ControlName TypeMethodControl
}