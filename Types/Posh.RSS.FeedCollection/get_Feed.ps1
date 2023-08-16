<#
.SYNOPSIS
    Gets feeds by name
.DESCRIPTION
    Gets all feeds in a collection by name.
#>
param()
$this.All | Group-Object Name -AsHashTable