#requires -Module Posh
#requires -Module PSDevOps
Import-BuildStep -ModuleName Posh
Push-Location ($PSScriptRoot | Split-Path)
New-GitHubWorkflow -Name "Test, Tag, Release, and Publish" -On Demand, Push -Job TagReleaseAndPublish,
    BuildPosh -OutputPath (
        Join-Path $pwd .\.github\workflows\TestReleaseAndPublish.yml
    )    

Pop-Location