# PowerShell hashtables are not always stored in the order they are declared.
@{
    MaybeFirstKey  = 1
    MaybeSecondKey = 2
    MaybeThirdKey  = 3
}

# If you want to ensure the order of hashtables, cast them to [Ordered]
[Ordered]@{
    FirstKey  = 1
    SecondKey = 2
    ThirdKey  = 3
}
