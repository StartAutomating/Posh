#requires -Module Posh
#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)
New-GitHubWorkflow -Name "Build and Publish Posh" -On Demand, Push -Job TagReleaseAndPublish,
    TestPowerShellOnLinux,
    BuildPosh -OutputPath (
        Join-Path $pwd .\.github\workflows\BuildAndPublishPosh.yml
    ) -Env @{     
        "AT_PROTOCOL_HANDLE" = "mrpowershell.bsky.social"
        "AT_PROTOCOL_APP_PASSWORD" = '${{ secrets.AT_PROTOCOL_APP_PASSWORD }}'
    }   

Pop-Location