<#
.SYNOPSIS
    Uses a preset
.DESCRIPTION
    Uses or applies a Posh preset.

    Posh presets will take the data in a *.preset.* file and apply it to a variable.    
#>

$importedData = 
    switch -regex ($this.Source) {
        '\.psd1$' {
            $importedAsLocalizedData = Import-LocalizedData -BaseDirectory ($this.Source | Split-Path) -FileName ($this.Source | Split-Path -Leaf)            
            if ($importedAsLocalizedData) {
                $replacedContent = [IO.File]::ReadAllText($this.Source) -replace '\@\{', '[Ordered]@{'
                & ([ScriptBlock]::Create($replacedContent))
            }
        }
        '\.json$' {
            Get-Content $this.Source -Raw | ConvertFrom-Json
        }
        '.\clixml' {
            Import-Clixml $this.Source
        }
    }


if ($importedData -is [Collections.IDictionary]) {
    $importedData = [PSCustomObject]$importedData
}

foreach ($importedProperty in $importedData.psobject.properties) {
    if ($importedProperty.Name -notmatch '^\$') { continue }
    
    $importedNameScript = [ScriptBlock]::Create($importedProperty.Name)
    $valueToImport = $importedProperty.Value
    if (-not $importedNameScript) { continue }
    
    $statements = $importedNameScript.Ast.EndBlock.Statements
    
    $currentValue = try { . $importedNameScript } catch {$null}     

    # If we are importing a dictionary value, try to set each value within the dictionary
    if ($valueToImport -is [Collections.IDictionary]) {        
        if ($currentValue -is [Collections.IDictionary]) {            
            foreach ($ToImport in $valueToImport.GetEnumerator()) {
                $currentValue[$ToImport.Key] = $ToImport.Value
            }
        }
    } elseif ($valueToImport.GetType -and (
        $valueToImport.GetType().IsPrimitive -or 
        $valueToImport.GetType() -in [string], [DateTime], [timespan] 
    )) {
        $global:ExecutionContext.SessionState.InvokeCommand.InvokeScript(        
            "$importedNameScript = $valueToImport"
        )
    } elseif ($currentValue -is [Collections.IDictionary]) {
        foreach ($ToImport in $valueToImport.psobject.properties) {
            $currentValue[$ToImport.Name] = $ToImport.Value
        }
    }   
}