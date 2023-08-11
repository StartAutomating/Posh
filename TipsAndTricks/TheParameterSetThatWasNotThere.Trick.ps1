# Parameter Sets are more powerful than you think:

# You can use "The Parameter Set That Wasn't There" to allow a command to be called with no parameters

# (and to know when that happens)

& { 
    [CmdletBinding(DefaultParameterSetName="NoParameters")]
    param(
    [Parameter(Mandatory,ParameterSetName="SomeParameters")]
    $SomeParameter
    )
    
    $PSCmdlet.ParameterSetName
}
