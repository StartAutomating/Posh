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
                    # An assembly can refuse to .GetTypes(), or otherwise have an exception
                    # we do not want this to worry anyone, so we catch the exception
                    $ex = $_
                    $error.RemoveAt(0) # and remove it from $error
                }
            }
        )
}

$this.'.Types'