<#
.SYNOPSIS
    Pushes an entry into a stackable function
.DESCRIPTION
    Pushes an entry into a stackable function.

    This overwrites the existing entry,
    and adds the previous value to the stack so it can be easily undone.
#>
param(
# The new value for the function
[ScriptBlock]
$Value
)

$this.Current = $Value