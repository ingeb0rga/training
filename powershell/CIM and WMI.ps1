#CPU model and max clock speed
Get-CimInstance -ComputerName localhost -ClassName Win32_Processor | Select Name, MaxClockSpeed

#Amount of RAM (total, free)
Get-CIMInstance -ComputerName localhost -ClassName Win32_OperatingSystem | Select FreePhysicalMemory, TotalVisibleMemory

#OS disk free space
Get-CimInstance -ComputerName localhost -ClassName Win32_LogicalDisk | Select Size, FreeSpace

#OS version
Get-CIMInstance -ComputerName localhost -ClassName Win32_OperatingSystem | Select Caption, Version

#Installed hot fixes
Get-CIMInstance -ClassName Win32_QuickFixEngineering
#Get-CIMInstance -ComputerName locahost -ClassName Win32_QuickFixEngineering

#List of stopped services
Get-CIMInstance -ClassName Win32_Service | Where-Object {$_.State -eq "Stopped"}
#Get-CimInstance -ComputerName localhost -Query "SELECT * FROM win32_service WHERE state='Stopped'"

#Смотрим залогинившихся пользователей
Get-WmiObject -ComputerName localhost Win32_LogonSession | ForEach-Object { 
    [PSCustomObject]@{ 
    LogonName = $_.GetRelated('Win32_Account').Caption 
        #SessionStarted = [System.Management.ManagementDateTimeConverter]::ToDateTime($_.StartTime) 
    } 
} 