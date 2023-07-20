<#
.SYNOPSIS
    Filters errors by command pattern
.DESCRIPTION
    Filters entries in $Error for items that have a .CommandLine matching the pattern.
.EXAMPLE
    $error.LineMatc("^Get")
#>
param(
# A regular expression.
$Match
)

,@(foreach ($err in $this) {
    if ($err.InvocationInfo.Line -match $match) {
        $err
    }
})