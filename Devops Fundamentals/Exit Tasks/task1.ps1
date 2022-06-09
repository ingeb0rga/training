[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    # Checking for invalid (reserved) 0.0.0.0 and 255.255.255.255 IP addresses
    [ValidateScript( {
        ($_ -ne "0.0.0.0") -and ($_ -ne "255.255.255.255")
    } )]
    [ipaddress]$ip_address_1,    # [ipaddress] variable type checks if the input parameter is a valid IP address

    [Parameter(Mandatory)]
    # Checking for invalid (reserved) 0.0.0.0 and 255.255.255.255 IP addresses
    [ValidateScript( {
        ($_ -ne "0.0.0.0") -and ($_ -ne "255.255.255.255")
    } )]
    [ipaddress]$ip_address_2,    # [ipaddress] variable type checks if the input parameter is a valid  IP address
    
    [Parameter(Mandatory)]
    # Checking if the input parameter is a valid subnet mask or CIDR prefix. Can't use [ipaddress] data type this time.
    [ValidateScript( {              
        ($_.split('.')[0] -in 0..255) -and ($_.split('.')[1] -in 0..255) -and ($_.split('.')[2] -in 0..255) -and ($_.split('.')[3] -in 0..255) `
        -or ($_ -in 0..32)
    } )]
    [string]$network_mask
)

# This script needed PSnmap/PSipcalc module to be installed.
# Installing from the PowerShell gallery in case it is not installed.
if (-Not (Get-Command -Name PSnmap -ErrorAction SilentlyContinue)) {
    Install-Module -Name PSnmap -Scope CurrentUser -Force
}

# Cheking if $ip_address_1 and $ip_address_2 hosts are in the same network
if (Invoke-PSipcalc -NetworkAddress "$ip_address_1/$network_mask" -Contains "$ip_address_2") {
    Write-Host "YES" -ForegroundColor Green
    Write-Host "$ip_address_1 and $ip_address_2 hosts are in the same network"
}
else {
    Write-Host "NO" -ForegroundColor Red
    Write-Host "$ip_address_1 and $ip_address_2 hosts are in different networks"
}