<#
.SYNOPSIS
    Get's a module's tips
.DESCRIPTION
    Gets tips and tricks from a module.

    Any module can contain `*.tip(s)` or `*.trick(s)` files, of the extensions:

    * .md
    * .txt
    * .ps1
    * .psd1
    * .json
    * .clixml

    The collection of tips can be accessed in a Module's .Tip(s) or .Trick(s) properties
    
#>
if (-not $this.'.Tip') {
    $tipCollection =
        [PSCustomObject][Ordered]@{
            PSTypeName  = 'Posh.ExtensionCollection'
            Module      = $posh
            Path        = $this.Path | Split-Path
            CommandType = 'Posh.Tip.Command'
        }

    $tipCollection.pstypenames.insert(0,'Posh.Tip.Collection')
    $this | Add-Member NoteProperty '.Tip' $tipCollection -Force
}
$this.'.Tip'