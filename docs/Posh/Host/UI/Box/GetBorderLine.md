Posh.Host.UI.Box.GetBorderLine()
--------------------------------

### Synopsis
Gets a border line

---

### Description

Gets a single border line of a box.

---

### Parameters
#### **LineType**
The type of line.
Valid Values:

* Top
* Bottom
* Middle
* Row

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Width**
The width of the border.  If no width is provided, will render a border the width of the screen.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **ColumnWidth**
The width of each column.
If this is a decimal less than or equal to 1, it will be considered a percentage of $Width

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Double[]]`|false   |3       |false        |

---
