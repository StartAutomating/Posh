<#
.SYNOPSIS
    Creates a new box
.DESCRIPTION
    Creates a new box, based off of a box shape name.
#>
param(
# The name of the box shape name.
[Parameter(Mandatory)]
[string]
$BoxName
)

if ($this.$BoxName -is [string]) {
    $newBoxObject = [PSObject]::new("$($this.$BoxName)")
    $newBoxObject.pstypenames.insert(0,'Posh.Host.UI.Box')
    $newBoxObject
}