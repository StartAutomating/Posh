Posh.Parameters.Remove()
------------------------

### Synopsis
Removes parameter default values.

---

### Description

Removes the default values for a command.

---

### Examples
> EXAMPLE 1

```PowerShell
$Posh.Parameters.Remove("Out-Default")
```

---

### Parameters
#### **Command**
The name of the command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Parameter**
The command parameters.
If this is a dictionary, each value will be used.
Otherwise, this will be treated as the name of the parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---
