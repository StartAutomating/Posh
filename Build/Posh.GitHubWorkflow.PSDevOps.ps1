#requires -Module Posh
#requires -Module PSDevOps
Import-BuildStep -ModuleName Posh
Push-Location ($PSScriptRoot | Split-Path)
New-GitHubWorkflow -Name "Build and Publish Posh" -On Demand, Push -Job TagReleaseAndPublish,
    TestPowerShellOnLinux,
    BuildPosh -OutputPath (
        Join-Path $pwd .\.github\workflows\BuildAndPublishPosh.yml
    )    

Pop-Location