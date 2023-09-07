<#
.SYNOPSIS
    Gets a Module's README
.DESCRIPTION
    Gets the content of README.md file located at the module root. 
#>
if ($this.'.README') {
    return $this.'.README'
}

$readmeFileExists = $this | 
    Split-Path | 
    Get-ChildItem | 
    Where-Object Name -eq 'README.md'

if ($readmeFileExists) {    
    $this | 
        Add-Member NoteProperty '.README' -Force (Get-Content -Raw $readmeFileExists)
    
    return $this.'.README'
}