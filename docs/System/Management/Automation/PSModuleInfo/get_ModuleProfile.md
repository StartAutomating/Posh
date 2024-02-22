System.Management.Automation.PSModuleInfo.get_ModuleProfile()
-------------------------------------------------------------

### Synopsis
Gets a Module's Profile

---

### Description

Gets the profile file associated with the module.

Any module can have a file within the same directory as $profile, named `$($this.Name).profile.ps1`.

This file may be loaded when the module loads, or anytime thereafter.

---
