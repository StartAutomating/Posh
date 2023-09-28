## Posh.NET


### What Is .NET?

.NET is a framework of tools for building almost anything you can imagine.

PowerShell is built on top of .NET, and makes it easy to interactively explore.

.NET is object-oriented and strongly typed.

### $Posh.NET

Posh makes .NET easier to explore.

For example, to see all primitive types, just run:

~~~PowerShell
$Posh.Net.Primitive
~~~

To see all attributes, use:

~~~PowerShell
$Posh.Net.Attribute
~~~

To see all possible exceptions, use:

~~~PowerShell
$Posh.Net.Exceptions
~~~

To see everything $Posh.Net makes easier, pipe it to `Get-Member`

~~~PowerShell
$Posh.Net | Get-Member
~~~

### .NET Types in PowerShell

You can reference any public .NET type in PowerShell by putting it within brackets:

~~~PowerShell
[int]
~~~

You can see if an object is a type using the -is operator:

~~~PowerShell
1 -is [int]
~~~

You can cast an object to a type by putting it before an expression:

~~~PowerShell
[int]"1"
~~~

If the object cannot be cast, you will get an exception.

To see if you can cast an object, use the -as operator

~~~PowerShell
"1" -as [int]
~~~
### Script Methods


* [get_Abstract](get_Abstract.md)
* [get_Assembly](get_Assembly.md)
* [get_Attribute](get_Attribute.md)
* [get_Cmdlet](get_Cmdlet.md)
* [get_Delegate](get_Delegate.md)
* [get_Enum](get_Enum.md)
* [get_Exception](get_Exception.md)
* [get_ExtensionType](get_ExtensionType.md)
* [get_Generic](get_Generic.md)
* [get_Interface](get_Interface.md)
* [get_Primitive](get_Primitive.md)
* [get_Private](get_Private.md)
* [get_Public](get_Public.md)
* [get_Static](get_Static.md)
* [get_Type](get_Type.md)
* [get_TypeAccelerator](get_TypeAccelerator.md)
* [set_TypeAccelerator](set_TypeAccelerator.md)
* [get_ValueType](get_ValueType.md)
