$temp = Read-Host "Введите значение температуры (C/F)"
Write-Host

if ($temp -match "^[0-9]*C$") {
    [int]$C = $temp.Replace('C', '')
    $F = ($F * 1.8) + 32
    Write-Host $temp" = "$F"F"
    
}
elseif ($temp -match "^[0-9]*F$") {
    [int]$C = $temp.Replace('F', '')
    $C = ($C - 32) * 5 / 9
    Write-Host $temp" = "$C"C"
}