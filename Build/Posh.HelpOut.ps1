$PoshLoaded = Get-Module Posh
Push-Location ($PSScriptRoot | Split-Path)
if (-not $PoshLoaded) {
    $PoshLoaded = Get-ChildItem -Recurse -Filter "*.psd1" | 
        Where-Object Name -eq 'Posh.psd1' | 
        Import-Module -Name { $_.FullName } -Force -PassThru
}
if ($PoshLoaded) {
    "::notice title=ModuleLoaded::Posh Loaded" | Out-Host
} else {
    "::error:: Posh not loaded" |Out-Host
}
if ($PoshLoaded) {
    Save-MarkdownHelp -Module $PoshLoaded.Name -PassThru -SkipCommandType Alias
}
Pop-Location