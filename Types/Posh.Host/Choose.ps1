<#
.SYNOPSIS
    Prompts a choice
.DESCRIPTION
    Prompts a choice between multiple options.

    An option can be a string, hashtable, or scriptblock.
    
    Hashtables keys and arrays will become a list of possible choices.
    
    Strings will be outputted as a message.

    A boolean will indicate multiple items can be chosen.
.Example
    $Posh.Host.Choose(
        "Cake Or Death?", 
        @("Cake", "Death")
    )
#>
param()

$captionAndMessage = @()

$choiceList = @()

$defaultChoices = @()

$multiselect = $false

foreach ($argument in $args) {
    if ($argument -is [string]) {
        $captionAndMessage += $argument
    }
    if ($argument -is [bool] -and $argument) {
        $multiselect = $true
    }
    
    if ($argument -is [Collections.IDictionary]) {
        if ($argument -is [hashtable]) {
            $choiceList += @($argument.GetEnumerator() | Sort-Object Key).Key
        } else {
            $choiceList += @($argument.GetEnumerator()).Key
        }
    } elseif ($argument -is [object[]]) {
        if ($argument -as [int[]]) {
            $defaultChoices += $argument
        } else {
            $choiceList += $argument
        }        
    }
}

$choiceList = @(
    foreach ($potentialChoice in $choiceList) {
        [Management.Automation.Host.ChoiceDescription]::new("$potentialChoice")
    }
)

if (-not $choiceList) { return }


$caption, $message = $captionAndMessage
if ($defaultChoices) {
    if (-not $multiselect) {
        $defaultChoices = $defaultChoices[0]            
        $choice = $host.UI.PromptForChoice($caption, $message, $choiceList, $defaultChoices)
    } else {            
        $choice = $host.UI.PromptForChoice($caption, $message, $choiceList, $defaultChoices)
    }
    
} else {
    $choice = 
    if ($multiselect) {
        $host.UI.PromptForChoice($caption, $message, $choiceList, [int[]]@(0))
    } else {
        $host.UI.PromptForChoice($caption, $message, $choiceList, 0)
    }
    
}

if ($choice -ne -1) {
    $choiceList[$choice].Label
}    

