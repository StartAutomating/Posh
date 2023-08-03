Push-Location (Split-Path $PSScriptRoot)
Initialize-Splatter -Verb Get, Use, Find, Merge -OutputPath .\@.ps1
Pop-Location    