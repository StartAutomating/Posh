<#
.SYNOPSIS
    Gets all interfaces
.DESCRIPTION
    Gets all currently loaded interfaces
#>
foreach ($type in $this.Type) {
    if ($type.IsInterface) {
        $type
    }
}