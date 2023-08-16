describe Posh {
    context "Improving the shell experience" {
        it "Formats itself" {
            Get-FormatData -TypeName Posh
        }
        it "Adds .Tip(s) to every module" {
            (Get-TypeData -TypeName PSModuleInfo).Members.Tip  | Should -Not -BeNullOrEmpty
            (Get-TypeData -TypeName PSModuleInfo).Members.Tips | Should -Not -BeNullOrEmpty
        }
        
        it "Adds .Link(s) to every module" {
            (Get-TypeData -TypeName PSModuleInfo).Members.Link | Should -Not -BeNullOrEmpty
            (Get-TypeData -TypeName PSModuleInfo).Members.Links | Should -Not -BeNullOrEmpty
            $posh.Links                           |
                Get-Random                        |
                Select-Object -ExpandProperty URL |
                Should -Not -BeNullOrEmpty
        }
        
        it "Adds .Test(s) to every module" {
            (Get-TypeData -TypeName PSModuleInfo).Members.Test | Should -Not -BeNullOrEmpty
            (Get-TypeData -TypeName PSModuleInfo).Members.Tests | Should -Not -BeNullOrEmpty
            $posh.Tests | Should -BeOfType ([IO.FileInfo])
        }

        it "Adds .Demo(s) to any module" {
            (Get-TypeData -TypeName PSModuleInfo).Members.Demo | Should -Not -BeNullOrEmpty
            (Get-TypeData -TypeName PSModuleInfo).Members.Demos | Should -Not -BeNullOrEmpty
            $posh.Demos | Should -BeOfType ([IO.FileInfo])
        }
    }
    
}