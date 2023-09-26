<#
.SYNOPSIS
    Gets loaded types
.DESCRIPTION
    Gets all currently loaded types.
.EXAMPLE
    $Posh.Net.Type
.EXAMPLE
    $Posh.Net.Types    
#>
if (-not ($this.'.Types')) {
    $this | 
        Add-Member NoteProperty '.Types' -Force -Value @(
            foreach ($assembly in $this.Assembly) {
                try {
                    $assembly.GetTypes()
                } catch {
                    $ex = $_
                    $error.RemoveAt(0) 
                }
            }
        )
}

$this.'.Types'