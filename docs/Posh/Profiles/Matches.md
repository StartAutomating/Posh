Posh.Profiles.Matches()
-----------------------




### Synopsis
Matches patterns within profiles



---


### Description

Matches a pattern within profile files.

All places the pattern is found will be returned.



---


### Examples
> EXAMPLE 1

```PowerShell
$Posh.Profile.Matches("Posh")
```


---


### Parameters
#### **Pattern**

The pattern to match.






|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Regex]`|false   |1       |false        |



#### **WhichProfile**

Which profile should the content be removed from?
The default is the current user's current host.



Valid Values:

* AllUsersAllHosts
* AllUsersCurrentHosts
* CurrentUserAllHosts
* CurrentUserCurrentHost






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |





---
