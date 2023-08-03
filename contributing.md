Posh welcomes careful contributions.

## No Commands

There is one primary ground rule when contributing to Posh:  No Commands.

Posh is primarily made up of Types and Format files built using [EZOut](https://github.com/StartAutomating/EZOut).

To test out these contributions locally, install and import EZOut, and then run .\Build\Posh.ezout.ps1

## Integrating with Posh

If you make PowerShell modules, Posh can help make your module easier to explore.

Posh provides several points of integration.

### Manifest Integrations

You can add data to your module manifest to integrate with Posh.

* Screenshots
* Videos
* Recommendations

This data will generally be in a hashtable or list of links.

For examples, refer to the Posh module.

### File integrations

Posh looks for some standardized file types to help improve a module's experience.

* .demo.ps1 files will be available in a module's .Demo(s)
* .tests.ps1 files will be available in a module's .Tests(s)



