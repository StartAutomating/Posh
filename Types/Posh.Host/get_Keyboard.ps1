if (-not $this.'.Keyboard') {
    Add-Member -InputObject $this -MemberType NoteProperty -Name '.Keyboard' -Value (
        [PSCustomObject]@{PSTypeName='Posh.Host.Keyboard'}
    ) -Force
}
$this.'.Keyboard'