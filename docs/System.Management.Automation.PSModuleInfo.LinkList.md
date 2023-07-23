System.Management.Automation.PSModuleInfo.LinkList()
----------------------------------------------------




### Synopsis
Returns a link list.



---


### Description

Returns a list of links from one or more properties in a module's manifest.



---


### Examples
#### EXAMPLE 1
```PowerShell
$posh.LinkList(@(
    $this.PrivateData.Screenshot
    $this.PrivateData.Screenshots
    $this.PrivateData.PSData.Screenshot
    $this.PrivateData.PSData.Screenshots
), "Posh.Module.Screenshot")
```



---


### Parameters
#### **InputObject**

One or more inputs to the list.






|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSObject[]]`|false   |1       |false        |



#### **PSTypeName**




|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |





---
