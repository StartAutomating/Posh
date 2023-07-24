<#
.SYNOPSIS
    Returns a link list.
.DESCRIPTION
    Returns a list of links from one or more properties in a module's manifest.
.EXAMPLE
    $posh.LinkList(@(
        $this.PrivateData.Screenshot
        $this.PrivateData.Screenshots
        $this.PrivateData.PSData.Screenshot
        $this.PrivateData.PSData.Screenshots
    ), "Posh.Module.Screenshot")
#>
param(
# One or more inputs to the list.
[PSObject[]]
$InputObject,

[string]
$PSTypeName = 'Posh.Module.Link'
)

filter ToLink {
    if ($_ -is [string]) {
        [PSCustomObject]@{
            PSTypeName = $PSTypeName
            Url        = $_
            Source     = $this
        }
    } elseif ($_ -is [Collections.IDictionary]) {
        $_.GetEnumerator() | Sort-Object Key | . ToLink
    } elseif ($_ -is [Collections.DictionaryEntry]) {
        [PSCustomObject][Ordered]@{
            PSTypeName = $PSTypeName
            Name = $_.key
            Url = $_.Value
            Source = $this
        }
    }
}


$inputObject | . ToLink
