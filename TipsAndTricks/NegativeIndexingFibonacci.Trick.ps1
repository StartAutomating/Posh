# People spend so much time demonstrating Fibonacci recursively
# Let's show how we can do this iteratively with negative indexing
& {
    param(
        [ValidateRange(0,2kb)]
        $FibonacciNumber
    ) 
    
    $FibonacciSequenece = [Collections.Generic.List[BigInt]]::new([BigInt[]]@(0,1))

    do {
        $FibonacciSequenece.Add(
            $FibonacciSequenece[-1] + $FibonacciSequenece[-2]
        )
    } while ($FibonacciSequenece.Count -lt $FibonacciNumber)
    $FibonacciSequenece

} -FibonacciNumber 17