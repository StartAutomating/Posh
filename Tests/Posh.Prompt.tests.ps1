describe "`$Posh.Prompt" {
    context "Customizes the prompt" {
        it "Lets you append content to the prompt" {
            $posh.Prompt.Append('!')
            prompt | should -BeLike '*!'
        }

        it "Lets you undo modifications" {
            $posh.Prompt.Undo()
            prompt | should -Not -BeLike '*!'
        }

        it "Lets you prepend modifications" {
            $posh.Prompt.Prepend('!')
            prompt | should -BeLike '!*'
            $posh.Prompt.Undo()
        }

        it "Allows you to Append or Prepend a ScriptBlock" {
            $posh.Prompt.Append({Get-Random})
            $posh.Prompt.Prepend({Get-Random})
            prompt | should -Match "^\d+"
            prompt | should -Match "\d+$"
            $posh.Prompt.Clear()
        }

        it "Enables replacement of prompt content" {
            $posh.Prompt.Replace([regex]"[\\/]", ">")
            prompt | should -Not -Match '[\\/]'
            $posh.Prompt.Undo()
        }

        it "Should keep invoke an underlying module's prompt in it's own session state" {
            # First, capture our existing prompt, outside of Posh

            $originalPrompt = $function:Prompt
            
            # Then, declare a new module that declares a prompt
            $testModule = New-Module -Name TestingPrompts -ScriptBlock {
                $moduleVar = "Hello >>"
                function Prompt {
                    $script:moduleVar
                }
            }

            # Now, import that module
            $testModule = $testModule | 
                Import-Module -Global -Force -PassThru

            # and re-import Posh
            Import-Module (Get-Module Posh | 
                Split-Path | 
                Join-Path -ChildPath "Posh.psd1") -Force -Global
            
            # Append the prompt
            $posh.Prompt.Append('!')

            # Get the value 
            $mv = . $testModule { $script:moduleVar} 
            # and ensure the prompt has the underlying value and it's change
            prompt | should -BeLike "${mv}*!"

            . $testModule { $script:moduleVar = "Goodbye >>"} 
            $mv2 = . $testModule { $script:moduleVar} 
            prompt | should -BeLike "${mv2}*!"

            $posh.Prompt.Clear()

            prompt | should -Be "${mv2}"

            $testModule | Remove-Module -Force

            New-Module -Name originalPrompt -ScriptBlock {
                param([ScriptBlock]$op)
                $function:Prompt = $op                
            } -ArgumentList $originalPrompt | Import-Module -Global            
        }
    }
}