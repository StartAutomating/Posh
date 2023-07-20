<#
.SYNOPSIS
    Gets errors by line
.DESCRIPTION
    Gets all lines that produced errors
.EXAMPLE
    $error.ByLine    
#>
$errorsByLine = 
    [Collections.Generic.Dictionary[
        string,
        [Collections.Generic.List[psobject]]
    ]]::new([System.StringComparer]::OrdinalIgnoreCase)


foreach ($err in $this) {
    
    $errLine = $err.InvocationInfo.Line
    if (-not $errLine) { continue }
    if (-not $errorsByLine[$errLine]) {
        $errorsByLine[$errLine] = [Collections.Generic.List[psobject]]::new()
    }
    $null = $errorsByLine[$errLine].Add($err)
}
$errorsByLine
