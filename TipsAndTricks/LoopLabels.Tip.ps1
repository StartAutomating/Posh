# Loops can have labels!

:GameLoop do {
    if ($Game.Playing) {
        continue GameLoop
    }
} while ($false)

# This makes it easier to control when a loop exits.

