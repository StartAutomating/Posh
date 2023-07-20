Posh.Errors.LineLike()
----------------------




### Synopsis
Filters errors by line wildcard



---


### Description

Filters entries in $Error for items that a .Line like a wildcard.



---


### Examples
#### EXAMPLE 1
```PowerShell
$error.LineLike("Get-*")
```



---


### Parameters
#### **Like**

A wildcard pattern.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |





---
