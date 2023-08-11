# You can assign the output of a loop in PowerShell

$OddNumbers = 
    foreach ($n in 1..100) {
        if ($n % 2) {
            $n
        }
    }
