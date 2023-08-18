<#
.SYNOPSIS
    Gets a module's issue URL.
.DESCRIPTION
    Gets the issues URL related to a module.
.NOTES
    The Module must set it's ProjectURI, and it must be on GitHub, or this will return nothing.
#>
if ($this.ProjectURI.Host -eq 'github.com') {
    [PSCustomObject][Ordered]@{
        Name = $this.Name
        Url = "$($this.ProjectURI)/issues"
        PSTypeName = 'Posh.Module.IssueURL'
    }    
}