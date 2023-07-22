<#
.SYNOPSIS
    Sets parameter default values.
.DESCRIPTION
    Sets the default value for a parameter.
.EXAMPLE
    $Posh.Parameters.SetDefault("Out-Default", "OutVariable", 'LastOutput')
#>
param(
# The name of the command.
$Command,

# The command parameters.
# If this is a dictionary, each value will be used.
# Otherwise, this will be treated as the name of the parameter.
$Parameter,

# The default value.
$DefaultValue
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
        $global:PSDefaultParameterValues["${defaultValueKey}:$($parameterKeyValue.Key)"] = 
            $parameterKeyValue.Value
    }
} else {
    $global:PSDefaultParameterValues["${defaultValueKey}:$Parameter"] = $DefaultValue
}