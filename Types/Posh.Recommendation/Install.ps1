<#
.SYNOPSIS
    Installs the recommended module
.DESCRIPTION
    Uses Install-Module to install the recommended module.
#>
param(

)

if ($this.Name -and -not $this.Url) {    
    Install-Module $this.Name -Scope CurrentUser -Force
}

