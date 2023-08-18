<#
.SYNOPSIS
    Gets a module's discussions URL.
.DESCRIPTION
    Gets the discussions URL related to a module.
.NOTES
    The Module must set it's ProjectURI, and it must be on GitHub, or this will return nothing.
#>
if ($this.ProjectURI.Host -eq 'github.com') {
    [PSCustomObject][Ordered]@{
        Name = "$($this.Name) Discussions"
        Url = "$($this.ProjectURI)/discussions"
        PSTypeName = 'Posh.Module.Link'
    }
}