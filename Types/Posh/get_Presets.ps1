# Get-Module 
$moduleRoots = Get-Module | Split-Path | Select-Object -Unique


foreach ($extensionFile in $posh.Commands.FindExtensions.Invoke(@(
        $posh
        $moduleRoots
    ))
) {
    if ($extensionFile.pstypenames -contains 'Posh.Preset.Command') {
        $extensionFile
    }
}