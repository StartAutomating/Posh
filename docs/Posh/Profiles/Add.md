Posh.Profiles.Add()
-------------------

### Synopsis
Adds content to a profile

---

### Description

Adds content to a PowerShell profile

---

### Parameters
#### **Content**
The content to add to your profile.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

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
