# You can use generic types in PowerShell.

# Just include inner types in inner brackets
[Collections.Generic.List[BigInt]]::new([BigInt[]]@(0,1))

# Whitespace does not matter too much.
[Collections.Generic.Dictionary[
        string,
        PSObject
]]::new() + @{a='b'}