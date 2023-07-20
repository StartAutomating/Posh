Posh.Errors.LineMatch()
-----------------------




### Synopsis
Filters errors by command pattern



---


### Description

Filters entries in $Error for items that have a .CommandLine matching the pattern.



---


### Examples
#### EXAMPLE 1
```PowerShell
$error.LineMatc("^Get")
```



---


### Parameters
#### **Match**

A regular expression.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |





---
