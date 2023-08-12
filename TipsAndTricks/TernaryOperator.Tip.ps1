# In PowerShell 7, there's a ternary operator.

# Let's use it to toss a coin

$CoinToss = (Get-Random) % 2 ? 'Heads' : 'Tails'

$CoinToss