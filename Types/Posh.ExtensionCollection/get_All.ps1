<#
.SYNOPSIS
    Gets all items in an extension collection.
.DESCRIPTION
    Gets all items in a collection of extended commands.
#>
if (-not $this.'.Cache') {
    if (-not $this.'.Module') { return @() }

    $findExtensionArgs  = @($this.'.Module') + @($this.'.Path')
    $allExtensionsFound = 
        @(:nextExtension 
            foreach ($foundExtension in 
                $posh.Commands.FindExtensions.Invoke($findExtensionArgs)
            ) 
            {
            if ($this.'.CommandType') {
                foreach ($typename in $this.'.CommandType') {
                    if ($foundExtension.pstypenames -contains $typename) {
                        $foundExtension
                        continue nextExtension
                    }
                }
            } else {
                $foundExtension
            }
            }
        )
    $this |
        Add-Member NoteProperty '.Cache' $allExtensionsFound -Force
}

return $this.'.Cache'