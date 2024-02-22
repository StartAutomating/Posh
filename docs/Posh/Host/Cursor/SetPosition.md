Posh.Host.Cursor.SetPosition()
------------------------------

### Synopsis
Sets the cursor position.

---

### Description

Sets the position of the cursor.  This is not supported in all terminals.

The position can be provided as a pair of integers.  

The first integer will be the row, the second integer will be the column.

The position can also be provided as an object with any of the following properties:

* X/Column/Left
* Y/Row/Top

---

### Notes
This method returns an escape sequence (it should be invisible).

---
