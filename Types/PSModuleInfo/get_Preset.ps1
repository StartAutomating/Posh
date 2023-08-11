<#
.SYNOPSIS
    Get's a module's presets
.DESCRIPTION
    Gets presets from a module.

    Any module can contain `*.preset(s)` files, of the extensions:
    
    * .psd1
    * .json
    * .clixml

    The collection of presets can be accessed in a Module's .Preset(s) properties    
#>
if (-not $this.'.Preset') {
    $PresetCollection =
        [PSCustomObject][Ordered]@{
            PSTypeName  = 'Posh.ExtensionCollection'
            Module      = $posh
            Path        = @(Get-Module | Split-Path) -as [string[]]
            CommandType = 'Posh.Preset.Command'
        }
    $PresetCollection.pstypenames.insert(0,'Posh.Preset.Collection')
    $this |
        Add-Member NoteProperty '.Preset' $PresetCollection -Force
}
$this.'.Preset'