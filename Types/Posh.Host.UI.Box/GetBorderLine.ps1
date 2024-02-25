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

if ($lineType -eq 'Row') {
    $wall = ' '
    $left = $this.LeftWall
    $middle = $this.MiddleVerticalWall
    $right = $this.RightWall    
} else {
    $left, 
        $right,
            $middle, 
                $wall = 
    $this."${lineType}Left",
        $this."${lineType}Right",
            ($this.("${lineType}Middle" -replace "MiddleMiddle", "Middle")),
                $this."${lineType}Wall"
}

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
}
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
    $totalWidth = 1
    for ($columnNumber = 0; $columnNumber -lt $columnWidths.Length; $columnNumber++) {
        if ($columnNumber) {
            $Middle
        }
        $thisColumnWidth = $columnWidths[$columnNumber]
        
        $wallSection = $Wall * $thisColumnWidth        
        $totalWidth += $wallSection.Length
        Write-Debug "Total Width: $totalWidth"
        if (($totalWidth + 2) -ge $Width) {
            if ($totalWidth -ge $width) {
                $n = ($totalWidth - $width) + 1
                $wallSection -replace ".{$n}$"
            } else {
                $wallSection.Substring(0, $wallSection.Length - 1)
            }
            
            break
        } else {
            $wallSection
        }
    }
    $totalWidth++
    $Right
) -join ''