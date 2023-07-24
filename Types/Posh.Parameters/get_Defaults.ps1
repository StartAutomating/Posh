$defaultsByCommand = [Ordered]@{}
foreach ($key in $global:PSDefaultParameterValues.Keys) {
    $commandName, $parameterName = $key -split ':',2
    if (-not $defaultsByCommand[$commandName]) {
        $defaultsByCommand[$commandName] = [Ordered]@{}
    }
    $defaultsByCommand[$commandName][$parameterName] = $global:PSDefaultParameterValues[$key]
}
$defaultsByCommand