foreach ($property in $this.psobject.properties) {
    if ($property -is [psnoteproperty] -and 
        $property.Name -match '^\.') {
        $property.Value = @()
    }
}