<#
.SYNOPSIS
    Mounts a module as a drive
.DESCRIPTION
    Mounts a module as a drive with the FileSystem provider.
#>
param(
# The name of the drive.  If not provided, this will be the module.
[string]
$DriveName,

# The root path.  If not provided, this will be the module's root.
[string]
$RootPath
)

if (-not $DriveName) {
    $DriveName = $this.Name
}

if (-not $RootPath) {
    $RootPath = $this | Split-Path
}

if ($DriveName -and $RootPath) {
    New-PSDrive -ErrorAction Ignore -Name $DriveName -Root $RootPath -PSProvider FileSystem -Scope Global
}
