@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v2'
        },
        @{    
            name = 'Use PSSVG Action'
            uses = 'StartAutomating/PSSVG@main'
            id = 'PSSVG'
        }
        'RunPipeScript',
        @{
            name = 'Run EZOut  (on master)'
            uses = 'StartAutomating/EZOut@master'
            id = 'EZOutMaster'
        }
        'RunHelpOut',
        @{
            name = 'GitLogger'
            uses = 'GitLogging/GitLoggerAction@main'
            id = 'GitLogger'
        }
    )
}