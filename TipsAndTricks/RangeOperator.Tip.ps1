# PowerShell has a range operator

1..10

# Ranges can be variables or expressions
(Get-Random -Min 1 -Max 10)..(Get-Random -Min 1 -Max 10)

# You can also use ranges to index.
@(1..10)[0..4]