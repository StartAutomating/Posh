Posh.Parameters.SetDefault()
----------------------------




### Synopsis
Sets parameter default values.



---


### Description

Sets the default value for a parameter.



---


### Examples
#### EXAMPLE 1
```PowerShell
$Posh.Parameters.SetDefault("Out-Default", "OutVariable", 'LastOutput')
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



#### **DefaultValue**

The default value.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |





---
