<#
.SYNOPSIS
    Removes parameter default values.
.DESCRIPTION
    Removes the default values for a command.
.EXAMPLE
    $Posh.Parameters.Remove("Out-Default")
#>
param(
# The name of the command.
$Command,

# The command parameters.
# If this is a dictionary, each value will be used.
# Otherwise, this will be treated as the name of the parameter.
$Parameter
)

$DefaultValueKey =
    if ($command -is [Management.Automation.CommandInfo]) {
        if ($command.Source) {
            $command.Source
        } else {
            $command.Name
        }        
    }
    else {
        "$command"
    }

if ($Parameter -is [Collections.IDictionary]) {
    foreach ($parameterKeyValue in $Parameter.GetEnumerator()) {
        $null = $global:PSDefaultParameterValues.Remove("${defaultValueKey}:$($parameterKeyValue.Key)")
    }
} elseif ($Parameter) {
    $null = $global:PSDefaultParameterValues["${defaultValueKey}:$Parameter"] = $DefaultValue
} else {
    $toRemoveKeys = $global:PSDefaultParameterValues.Keys -like "${defaultValueKey}:*"
    foreach ($toRemove in $toRemoveKeys) {
        $null = $global:PSDefaultParameterValues.Remove($toRemove)
    }
}