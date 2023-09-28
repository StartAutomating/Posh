Posh.Profiles.ImportModule()
----------------------------




### Synopsis
Imports a module in a profile



---


### Description

Adds code to import a module in your profile.
This will ensure the module is loaded whenever you're running PowerShell.



---


### Examples
> EXAMPLE 1

```PowerShell
$Posh.Profile.ImportModule("Posh")
```


---


### Parameters
#### **Module**

The name of the module to import.






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
