$module = $this

$recommendations = @(
    $module.PrivateData.Recommends
    $module.PrivateData.Recommend
    $module.PrivateData.Recommendation
    $module.PrivateData.Recommendations
) -ne $null

foreach ($recommendation in $recommendations) {
    
    # If the recommendation was a dictionary
    if ($recommendation -is [Collections.IDictionary]) {
        # walk over each key/value in the dictionary
        foreach ($recommendationKeyValue in $recommendation.GetEnumerator()) {
            $recommendationValue = $recommendationKeyValue.Value
            if ($recommendationKeyValue.Key -is [string] -and 
                $recommendationValue -is [string]
            ) { 
                if ($recommendationValue -match '://') {
                    [PSCustomObject]@{
                        PSTypeName = 'Posh.Recommendation'
                        Name       = $recommendationValue
                        Type       = 'URL'
                        Source     = $module
                    }
                } else {
                    [PSCustomObject]@{
                        PSTypeName = 'Posh.Recommendation'
                        Name       = $recommendationValue
                        Type       = 'Module'
                        Source     = $module
                    }
                }
                continue
            }

            foreach ($recommendationValue in $recommendationKeyValue.Value) {
                if ($recommendationValue -match '://') {
                    [PSCustomObject]@{
                        PSTypeName = 'Posh.Recommendation'
                        Name       = $recommendationValue
                        Type       = 'URL'
                        Source     = $module
                    }
                } elseif ($recommendationValue -is [string]) {
                    [PSCustomObject]@{
                        PSTypeName = 'Posh.Recommendation'
                        Name       = $recommendationValue
                        Type       = 'Module'
                        Source     = $module
                    }
                } elseif ($recommendationValue -is [Collections.IDictionary]) {
                    [PSCustomObject][Ordered]@{
                        PSTypeName = 'Posh.Recommendation'
                    } + $recommendationValue
                }
            }    
        }        
    } else {
        
        foreach ($recommendationValue in $recommendation) {
            if ($recommendationValue -is [string]) {
                [PSCustomObject]@{
                    PSTypeName = 'Posh.Recommendation'
                    Name       = $recommendationValue
                    Type       = 'Module'
                    Source     = $module
                }
            } elseif ($recommendationValue -is [Collections.IDictionary]) {
                [PSCustomObject][Ordered]@{
                    PSTypeName = 'Posh.Recommendation'
                } + $recommendationValue
            }            
        }
    }
}
