Posh.Profiles.New()
-------------------

### Synopsis
Creates a new profile

---

### Description

Creates a new profile, or returns an existing profile.

---

### Examples
> EXAMPLE 1

```PowerShell
$Posh.Profile.New()
```

---

### Parameters
#### **WhichProfile**
Which profile should be created?
The default is the current user's current host.
Valid Values:

* AllUsersAllHosts
* AllUsersCurrentHosts
* CurrentUserAllHosts
* CurrentUserCurrentHost

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---
