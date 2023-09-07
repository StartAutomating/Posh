Write-FormatView -TypeName Microsoft.PowerShell.Commands.GenericMeasureInfo, Microsoft.PowerShell.Commands.TextMeasureInfo -Action {
    Write-FormatViewExpression -ScriptBlock {
        $visibleProperties = 
            @(foreach ($property in $_.psobject.properties) {
                if ($null -ne $property.Value) {
                    $property
                }
            })

        $longest = 0                
        $visibleProperties.Name.Foreach({
            if ($_.Length -gt $longest) {
                $longest = $_.Length
            }
        })

        @(foreach ($visibleProperty in $visibleProperties) {
            $visibleProperty.Name.PadRight($longest, ' ') + 
                ' : ' + 
                $visibleProperty.Value
        }) -join [Environment]::NewLine
    }    
}
Write-FormatView -TypeName Microsoft.PowerShell.Commands.GenericMeasureInfo -Property Count, Average, Sum, Maximum, Minimum, StandardDeviation, Property -AutoSize -Name All

Write-FormatView -TypeName Microsoft.PowerShell.Commands.GenericMeasureInfo -Property Minimum,Maximum -AutoSize -Name MinMax

Write-FormatView -TypeName Microsoft.PowerShell.Commands.TextMeasureInfo -Property Lines, Words, Characters -AutoSize