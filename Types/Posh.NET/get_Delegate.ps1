<#
.SYNOPSIS
    Gets delegates
.DESCRIPTION
    Gets all currently loaded delegates.
.EXAMPLE
    $Posh.Net.Delegate
.EXAMPLE
    $Posh.Net.Delegates
#>
foreach ($type in $this.Public) {
    if ($type.IsSubclassOf([Delegate])) {
        $type
    }
}