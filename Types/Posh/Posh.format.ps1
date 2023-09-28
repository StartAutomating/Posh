Write-FormatView -TypeName Posh -Action {
    
    Write-FormatViewExpression -Style "Foreground.Blue", "Bold" -Property Name
    Write-FormatViewExpression -Style "Foreground.Cyan" -Text ' @ '
    Write-FormatViewExpression -Property Version -ControlName VersionControl
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

    Write-FormatViewExpression -Style 'Foreground.Magenta' -ScriptBlock {
        "To see PowerShell tips, try `$posh.Tips",
        "To see PowerShell links, use `$Posh.Links",
        "To see PowerShell module recommendations, get `$Posh.Recommends",
        "To see PowerShell news, get `$Posh.News",
        "To explore .NET in Powershell, try `$Posh.Net" | Get-Random
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -Style 'Foreground.Cyan' -ScriptBlock {
"
To see everything Posh can do: `$posh | Get-Member
"
    }

    Write-FormatViewExpression -Newline
}