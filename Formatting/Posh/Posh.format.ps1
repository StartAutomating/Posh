Write-FormatView -TypeName Posh -Action {
    
    Write-FormatViewExpression -Style "Foreground.Blue", "Bold" -Property Name
    Write-FormatViewExpression -Style "Foreground.Cyan" -Text ' @ '
    Write-FormatViewExpression -Style "Foreground.Cyan", "Bold" -Property Version
    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline
    
    Write-FormatViewExpression -Style "Foreground.Blue", "Italic" -ScriptBlock {
        $_.Description
    } 
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style "Foreground.Green" -ScriptBlock {
        $_.PrivateData.ExtendedDescription
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To see PowerShell tips, use `$posh.Tips"
    }

    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
        "To see PowerShell links, use `$posh.Links"
    }

    Write-FormatViewExpression -Newline
}