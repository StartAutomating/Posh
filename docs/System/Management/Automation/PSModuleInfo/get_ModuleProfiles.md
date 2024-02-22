System.Management.Automation.PSModuleInfo.get_ModuleProfiles()
--------------------------------------------------------------

### Synopsis
Gets a Module's Profiles

---

### Description

Gets the profile files associated with the module.

Any module can have a file within the same directory any valid $profile location, named `$($this.Name).profile.ps1`.

This file may be loaded when the module loads, or anytime thereafter.

---
