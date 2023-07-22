@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v2'
        },
        @{    
            name = 'PSSVG'
            uses = 'StartAutomating/PSSVG@main'
            id = 'PSSVG'
        },
        @{    
            name = 'Splatter'
            uses = 'StartAutomating/Splatter@main'
            id = 'Splatter'
        },
        'RunPipeScript',
        @{
            name = 'EZOut'
            uses = 'StartAutomating/EZOut@master'
            id = 'EZOut'
        }
        'RunHelpOut',
        @{
            name = 'GitLogger'
            uses = 'GitLogging/GitLoggerAction@main'
            id = 'GitLogger'
        }
    )
}