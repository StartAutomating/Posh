Write-FormatView -TypeName System.Management.Automation.PSEventArgs -Property EventId, SourceId, Time, Sender, SourceArgs, MessageData -AlignProperty ([Ordered]@{
    EventID = 'Right'
    SourceID = 'Left'
    Time = 'Center'
    Sender = 'Left'    
}) -VirtualProperty @{
    EventID =  { "" + $_.EventID + ' '}
    Time =  { $_.Time.ToShortTimeString() }
}