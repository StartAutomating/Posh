Write-FormatView -TypeName Posh.NET -Action {
    Write-FormatViewExpression -Style 'Foreground.Green', 'Bold' -ScriptBlock {        
        Show-Markdown -InputObject $_.README                
    }

    Write-FormatViewExpression -Newline    

    Write-FormatViewExpression -ScriptBlock {
        [PSCustomObject][Ordered]@{
            'Assemblies'     = $_.Assemblies.Count
            'Types'          = $_.Type.Count
            'Public Types'   = $_.Public.Count
            'Private Types'  = $_.Private.Count
            'Primitive Types'= $_.Primitive.Count
            'Generic Types'  = $_.Generic.Count
            'Enums Types'    = $_.Enum.Count
            'Value Types'    = $_.ValueType.Count
            'Abstract Types' = $_.Abstract.Count
        } | Format-List | Out-String
    }
}