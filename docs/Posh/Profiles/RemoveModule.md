Posh.Profiles.RemoveModule()
----------------------------




### Synopsis
Remove a module from a profile



---


### Description

Remove code that imports a module in your profile.



---


### Examples
> EXAMPLE 1

```PowerShell
$Posh.Profile.RemoveModule("Posh")
```


---


### Parameters
#### **Module**

The name of the module to no longer import.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |



#### **WhichProfile**

Which profile should the content be added to?
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
