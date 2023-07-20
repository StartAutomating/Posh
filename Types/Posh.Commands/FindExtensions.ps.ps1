<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE
    $posh.Commands.FindExtensions($posh, "$pwd")
#>
$targetModules = @()
$targetPaths = @()
$loadedModules = Get-Module
foreach ($arg in $args) {
    if ($arg -is [Management.Automation.PSModuleInfo]) {
        $targetModules += $arg
    }
    elseif ($arg -is [IO.FileInfo] -or $arg -is [IO.DirectoryInfo]) {
        $targetPaths += $arg
    } 
    elseif ($arg -is [Management.Automation.PathInfo]) {
        $targetPaths += "$arg"
    }
    elseif ($arg -is [string]) {
        $argIsModule = 
            foreach ($module in $loadedModules) { if ($module.Name -like $arg) { $module}}
        if ($argIsModule) {
            $targetModules += $argIsModule
        } elseif (Test-Path $arg) {
            $targetPaths += $arg
        }
        
    }
}

if (-not $targetModules) { $targetModules = $posh.Modules}
$Splat = @{}
if ($targetPaths) {
    $Splat.FilePath = $targetPaths
}
foreach ($module in $targetModules) {
    Aspect.ModuleExtendedCommand -Module $module @Splat
}