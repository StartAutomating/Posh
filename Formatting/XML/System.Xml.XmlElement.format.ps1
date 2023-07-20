$showElementIf = {'#text','#whitespace','#comment','#document' -notcontains $_.LocalName }
Write-FormatTreeView -Property @({
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -if $showElementIf -ScriptBlock { '<'.Trim() }
    Write-FormatViewExpression -Style 'Foreground.BrightBlue', 'Bold' -if $showElementIf -ScriptBlock {
        $_.LocalName
    }
    Write-FormatViewExpression -ControlName XmlAttributeControl -ScriptBlock {$_.Attributes} -Enumerate -If {
        $_.HasAttributes -and '#text', '#whitespace' -notcontains $_.LocalName
    }
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -ScriptBlock {
        if ($_.HasChildren -or $_.HasChildNodes) {
            '>'
        } else {
            '/>'
        }
    } -if $showElementIf
    Write-FormatViewExpression -If { $_.LocalName -in '#text' } -ScriptBlock {$_.InnerText } -Style 'Foreground.Green'
    Write-FormatViewExpression -If { $_.LocalName -in '#comment' } -ScriptBlock { "<!--$($_.InnerText)-->" + [Environment]::NewLine } -Style 'Foreground.BrightGreen'
}) -TypeName System.Xml.XmlElement -HasChildren { $_.HasChildren -or $_.HasChildNodes -and $_.LocalName -ne '#whitespace'} -Children {
    @(foreach ($cn in $_.ChildNodes) {
        if ($cn.LocalName -eq '#whitespace') { continue }
        $cn
    })
} -EndBranchScript {
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -ScriptBlock {
        if (-not ($_.HasChildren -or $_.HasChildNodes)) {
            ''
        } else {
            [Environment]::NewLine + (' ' * ($script:TreeDepth - 1)* 4) + '</'
        }
    }
    Write-FormatViewExpression -Style 'Foreground.BrightBlue', 'Bold' -ScriptBlock {
         if ($_.HasChildren -or $_.HasChildNodes) { $_.LocalName}
    }
    Write-FormatViewExpression -Style 'Foreground.BrightBlack' -ScriptBlock {
         if ($_.HasChildren -or $_.HasChildNodes) {'>'}
    }
} -ControlName XmlNodeControl
