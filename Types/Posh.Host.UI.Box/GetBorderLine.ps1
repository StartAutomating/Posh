<#
.SYNOPSIS
    Gets a border line
.DESCRIPTION
    Gets a single border line of a box.
#>
param(
# The type of line.
[ValidateSet('Top','Bottom','Middle','Row')]
[string]
$LineType,

# The width of the border.  If no width is provided, will render a border the width of the screen.
[int]
$Width,

# The width of each column.
# If this is a decimal less than or equal to 1, it will be considered a percentage of $Width
[double[]]
$ColumnWidth
)


if (-not $Width) {
    $width = $host.UI.RawUI.BufferSize.Width
}

$left, 
    $right,
        $middle, 
            $wall = 
$this."${lineType}Left",
    $this."${lineType}Right",
        ($this.("${lineType}Middle" -replace "MiddleMiddle", "Middle")),
            $this."${lineType}Wall"

if (-not $wall) { $wall = ' '}
if (-not $left) { $left = $this.LeftWall }
if (-not $middle) { $middle = $this.MiddleWall }
if (-not $right) { $right = $this.RightWall }
if (-not $ColumnWidth) {
    return $(switch ($width) {
        1 { $left }
        2 { $right +  $right }
        default {
            if ($width -ge 0) {
                $left + ($wall * ($Width - 2)) + $right
            }
        }
    })
} else {
    $currentTotalWidth = 0
    $columnWidths = @(foreach ($eachColumnWidth in $ColumnWidth) {
        $columnsWide = 
            if ($eachColumnWidth -le 1) {
                ([int][Math]::Floor($width * $eachColumnWidth) - 1)
            } else {
                $eachColumnWidth -as [int]
            }
        if ($width -ge ($columnsWide + $currentTotalWidth)) {
            $currentTotalWidth+=$columnsWide
            $columnsWide
        }
    })

    @(
        $left
        for ($columnNumber = 0; $columnNumber -lt $columnWidths.Length; $columnNumber++) {
            if ($columnNumber) {
                $Middle
            }
            $Wall * $columnWidths[$columnNumber]
        }
        $Right
    ) -join ''
    
}