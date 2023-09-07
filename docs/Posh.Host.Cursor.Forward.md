Posh.Host.Cursor.Forward()
--------------------------




### Synopsis
Moves the cursor forward



---


### Description

Moves the cursor N (default 1) cells back.    
If the cursor is already at the edge of the screen, this has no effect.



---


### Parameters
#### **Distance**

How far the cursor should move






|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |1       |false        |N      |





---


### Notes
This method returns an escape sequence (it should be invisible).



---
