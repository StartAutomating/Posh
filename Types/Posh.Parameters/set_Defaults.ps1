$argArray = @(
    foreach ($arg in $args) {
        $arg
    }
)
$this.SetDefault.Invoke($argArray)
