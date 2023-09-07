$colorNameAndMemberType = 
    {
        
        @(
        if ($_.MemberType -notin 'Method','Property','ParemeterizedProperty') {
            "Italic"       
        }
        if ($_.MemberType -like '*property*') {        
            "Foreground.Green"            
            "Bold"
        }
        elseif ($_.MemberType -like '*method' -or $_.MemberType -eq 'Event') {
            "Formatting.Warning"
        })        
    }

Write-FormatView -TypeName System.Management.Automation.PSMemberInfo Name, MemberType, IsInstance, Value -StyleProperty @{
    Name = $colorNameAndMemberType
    MemberType = $colorNameAndMemberType    
}

Write-FormatView -TypeName System.Management.Automation.PSMemberInfo Name, MemberType, IsInstance, Value -Wrap -Name Wrap -StyleProperty @{
    Name = $colorNameAndMemberType
    MemberType = $colorNameAndMemberType    
}