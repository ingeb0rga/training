function Get-ValueFromPipe {
    param ([array]$array)
    
    begin {}
    process {ForEach-Object {Write-Host "Value from pipe:" $_}}
    end {}
}