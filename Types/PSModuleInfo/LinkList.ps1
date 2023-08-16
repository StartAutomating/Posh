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

# The name of each item in the list.
[string]
$PSTypeName = 'Posh.Module.Link',

# The name of a collection.  
# If this is provided, a collection containing all items will be returned.
[string]
$CollectionTypeName
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


if ($CollectionTypeName) {
    [PSCustomObject][Ordered]@{
        PSTypeName = $CollectionTypeName
        All = @($inputObject | . ToLink)
    }
} else {
    $inputObject | . ToLink
}

