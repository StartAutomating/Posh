<#
.SYNOPSIS
    Sets the cursor position.
.DESCRIPTION
    Sets the position of the cursor.  This is not supported in all terminals.

    The position can be provided as a pair of integers.  
    
    The first integer will be the row, the second integer will be the column.
    
    The position can also be provided as an object with any of the following properties:

    * X/Column/Left
    * Y/Row/Top
.NOTES
    This method returns an escape sequence (it should be invisible).
#>

$argList = @($args | . { process { $_ }})


$coordinates = 
    if ($argList -as [int[]]) {
        $argList -as [int[]]
    }
    elseif ($argList.Length -eq 1) {
        $arg = $args[0]
        
        if ($arg.Y) {
            $arg.Y
        }
        elseif ($arg.Row) {
            $arg.Row
        }
        elseif ($arg.Top) {
            $arg.Top
        }

        if ($arg.X) {
            $arg.X
        }
        elseif ($arg.Column) {
            $arg.Column
        }
        elseif ($arg.Left) {
            $arg.Left
        }
    }

if ($coordinates -and $coordinates.Length -eq 2) {    
    "`e[$($coordinates[0]);$($coordinates[1])H"
}

