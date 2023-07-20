<#
.SYNOPSIS
    Filters errors by line wildcard
.DESCRIPTION
    Filters entries in $Error for items that a .Line like a wildcard.
.EXAMPLE
    $error.LineLike("Get-*")
#>
param(
# A wildcard pattern.
[string]
$Like
)

,@(foreach ($err in $this) {
    if ($err.InvocationInfo.Line -like $Like) {
        $err
    }
})