Posh.Host.Cursor.Down()
-----------------------

### Synopsis
Moves the cursor down

---

### Description

Moves the cursor N (default 1) cells down.    
If the cursor is already at the edge of the screen, this has no effect.

---

### Parameters
#### **Distance**
How far the cursor should move

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

---

### Notes
This method returns an escape sequence (it should be invisible).

---
