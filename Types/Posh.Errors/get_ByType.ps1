<#
.SYNOPSIS
    Gets Errors By Type
.DESCRIPTION
    Returns all errors, by type of error.
.EXAMPLE
    $posh.Errors.ByType
#>
$errorsByType = 
    [Collections.Generic.Dictionary[
        type,
        [Collections.Generic.List[psobject]]
    ]]::new()


foreach ($err in $this) {
    
    $exceptionType = if ($err.Exception) {
        $err.Exception.GetType()
    } else {
        $err.GetType()
    }
    if (-not $errorsByType[$exceptionType]) {
        $errorsByType[$exceptionType] = [Collections.Generic.List[psobject]]::new()
    }
    $null = $errorsByType[$exceptionType].Add($err)
}
$errorsByType
