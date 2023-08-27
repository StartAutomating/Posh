Write-FormatView -TypeName System.Type -Property FullName, BaseType, IsPublic, IsSerializable -AutoSize

Write-FormatView -TypeName n/a -AsControl -Name TypeInheritanceControl -Action {
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -ScriptBlock { ' ' * 1 }     
    Write-FormatViewExpression -Style 'Formatting.Verbose' -ScriptBlock { $_ } -ControlName TypeNameControl
    Write-FormatViewExpression -ScriptBlock { ' ' * 1 }
    Write-FormatViewExpression -If { $_.BaseType -and -not $_.IsValueType } -ScriptBlock { 
        ':'
    }
    Write-FormatViewExpression -If { $_.BaseType -and -not $_.IsValueType -and $_.BaseType -ne [Object] } -Property BaseType -ControlName TypeBase      
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -ScriptBlock { '=' * ($Host.UI.RawUI.BufferSize.Width - 1) }
}


$TypeGrouping = [Ordered]@{
    GroupByScript = { 
    "
    ... | Format-Custom -View Full       # To show public and private members
    ... | Format-Custom -View Public     # To show public members
    ... | Format-Custom -View Private    # To show private members
    ... | Format-Custom -View Interfaces # To show interfaces
    "
    }
}

Write-FormatView -TypeName System.Type -Action {    
    Write-FormatViewExpression -ControlName TypeInheritanceControl -ScriptBlock { $_ }
} -GroupLabel 'Type Inheritance' @TypeGrouping  -Name Inheritance

Write-FormatView -TypeName System.Type -Action {    
    Write-FormatViewExpression -ControlName TypeInheritanceControl -ScriptBlock { $_ }
    Write-FormatViewExpression -If { $_.GetInterfaces() } -ScriptBlock { $_.GetInterfaces() | Sort-Object Name} -Enumerate -ControlName TypeInterfaceControl
} -GroupLabel 'Type Inheritance' @TypeGrouping  -Name Interfaces

foreach ($viewName in 'Public','Private','Full') {
    $bindingFlags = 
        switch ($viewName) {
            Public { 
                'Public'
            }
            Private {
                'NonPublic'
            }
            Full {
                'Public,NonPublic'
            }
        }
    $assignView = [ScriptBlock]::Create("
`$_ |
    Add-Member NoteProperty '.View' '$viewName' -PassThru -Force | 
    Add-Member NoteProperty '.BindingFlags' ([Reflection.BindingFlags]'$bindingFlags') -Force
")

Write-FormatView -TypeName System.Type -Action {
    Write-FormatViewExpression -If $assignView -ScriptBlock { "" }    
    
    Write-FormatViewExpression -ControlName TypeInheritanceControl -ScriptBlock { $_ }

    Write-FormatViewExpression -If { 
        $_.GetInterfaces()
    } -ScriptBlock { 
        $_.GetInterfaces() | Sort-Object Name
    } -Enumerate -ControlName TypeInterfaceControl

    Write-FormatViewExpression -ControlName TypeConstructorsControl -ScriptBlock { 
        if ($_.'.BindingFlags') {
            @{Type=$_;BindingFlags="Instance,$($_.'.BindingFlags')"}
        } else {
            $_
        }
    }

    Write-FormatViewExpression -ControlName TypeEventsControl -ScriptBlock { 
        if ($_.'.BindingFlags') {
            @{Type=$_;BindingFlags="Instance,$($_.'.BindingFlags')"}
        } else {
            $_
        }
    }

    Write-FormatViewExpression -ControlName TypePropertiesControl -ScriptBlock { 
        if ($_.'.BindingFlags') {
            @{Type=$_;BindingFlags="$($_.'.BindingFlags')"}
        } else {
            $_
        }
    }

    Write-FormatViewExpression -ControlName TypeMethodsControl -ScriptBlock { 
        if ($_.'.BindingFlags') {
            @{Type=$_;BindingFlags="$($_.'.BindingFlags')"}
        } else {
            $_
        }
    }    
} -Name "$ViewName" -GroupLabel "Type $ViewName" @TypeGrouping
}
