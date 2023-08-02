# 1. Making Prompts more Posh

# `Prompt` is a PowerShell function that is called just before PowerShell asks for input.

# It outputs the text that goes before a prompt.

# Modifying the PowerShell prompt can be incredibly useful.

# This is why Posh makes modifying the prompt easy.

#2. Replacing parts of the prompt

# We can see information about the current prompt by running:

$Posh.Prompt

# Let's use Get-Member to see what we can do:

$Posh.Prompt | Get-Member

# Now let's modify the prompt to replace the username with astericks

$Posh.Prompt.Replace(
    $(if ($env:User) { $env:User } else { $env:USERNAME }),
    '*****'
)

#.ShowPrompt

# Now let's replace the start of the prompt.

# We can provide a string, scriptblock, or emoji number.

$Posh.Prompt.Replace("PS ", 0x2AA1)

# Looks nice.  Let's replace the end of the prompt.

$Posh.Prompt.Replace(">", 0x2AA2)

# For extra fun, let's add some content to the end of the prompt

$Posh.Prompt.Append({(Get-Date).ToShortTimeString()})

# Hmm, that isn't quite distintive enough.  Let's undo that step.

$Posh.Prompt.Pop()

# Now let's add a "better" end to the prompt:

$Posh.Prompt.Append({
    "[$((Get-Date).ToShortTimeString())]"
})

# Posh provides the fundamental building blocks to modify your prompt.

# May it make your shell more sleek.
