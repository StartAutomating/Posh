<#
.SYNOPSIS
    Dismounts a module as a drive
.DESCRIPTION
    Dismounts a module as a drive.
#>
param(
# The name of the drive.  If not provided, this will be the module.
[ValidatePattern("^\w{2,}")]
[string]
$DriveName
)

if (-not $DriveName) {
    $DriveName = $this.Name
}


if ($DriveName) {
    Remove-PSDrive -Name $DriveName -Scope Global -Force
}
