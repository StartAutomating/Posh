System.Management.Automation.PSModuleInfo.Mount()
-------------------------------------------------

### Synopsis
Mounts a module as a drive

---

### Description

Mounts a module as a drive with the FileSystem provider.

---

### Parameters
#### **DriveName**
The name of the drive.  If not provided, this will be the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **RootPath**
The root path.  If not provided, this will be the module's root.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---
