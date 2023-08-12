Write-FormatView -TypeName Microsoft.PowerShell.Commands.SelectXmlInfo -Property Node, Pattern -GroupByProperty "Path" -VirtualProperty @{
    Node = {$_.Node.LocalName }
}