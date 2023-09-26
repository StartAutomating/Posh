Posh.Stackable.Replace()
------------------------




### Synopsis
Replaces content within a function



---


### Description

Replaces content within a stackable function, such as the prompt.



---


### Examples
Replace both ends of the prompt

```PowerShell
$Posh.Prompt.Replace('PS ', 0x27d6,$true).Replace('>', 0x27d5, $true)
```
> EXAMPLE 2

```PowerShell
$Posh.Prompt.Replace($(
    if ($env:User) {
        $env:User
    } elseif ($env:UserName) {
        $env:UserName
    }
),'***')
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
