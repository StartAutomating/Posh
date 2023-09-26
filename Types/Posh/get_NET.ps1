if (-not $this.'.NET') {
    $this | Add-Member NoteProperty '.NET' -Value ([PSCustomObject]@{PSTypeName='Posh.NET'})
}

$this.'.NET'