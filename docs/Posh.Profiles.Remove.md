Posh.Profiles.Remove()
----------------------




### Synopsis
Removes content from a profile



---


### Description

Removes content from a PowerShell profile.



---


### Parameters
#### **Content**

The content to remove.
If the content is a regular expression pattern, any matches will be removed.
Otherwise, any case-insensitive occurances of the string will be removed.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |



#### **WhichProfile**

Which profile should the content be removed from?
The default is the current user's current host.



Valid Values:

* AllUsersAllHosts
* AllUsersCurrentHosts
* CurrentUserAllHosts
* CurrentUserCurrentHost






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |





---
