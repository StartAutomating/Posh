Posh.Profiles.Replace()
-----------------------

### Synopsis
Replaces content in a profile

---

### Description

Replaces content in a PowerShell profile.

---

### Parameters
#### **Content**
The content to replace.
If the content is a regular expression pattern, any matches will be replaced.
Otherwise, any case-insensitive occurances of the string will be replaced.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Replacement**
The content to replace.
If content replaced was a regular expression,
this will be treated as a [Regular Expression substitution](https://learn.microsoft.com/en-us/dotnet/standard/base-types/substitutions-in-regular-expressions).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

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
|`[String]`|false   |3       |false        |

---
