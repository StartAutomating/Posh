Push-Location (Split-Path $PSScriptRoot)
Initialize-Splatter -Verb Get, Use, Find -OutputPath .\@.ps1
Pop-Location
