Posh.Input.Replace()
--------------------




### Synopsis
Replaces content within a function



---


### Description

Replaces content within a stackable function, such as the prompt.



---


### Examples
#### EXAMPLE 1
```PowerShell
# Replace both ends of the prompt
$Posh.Prompt.Replace('PS ', 0x27d6,$true).Replace('>', 0x27d5, $true)
```



---


### Parameters
#### **Replace**

The content to replace






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |



#### **Value**

The new value






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |





---
