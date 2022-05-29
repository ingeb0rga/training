$temp = Read-Host "Значение температуры (C/F)"

if ($temp -match "^[0-9]*C$") {
    [int]$C = $temp.Replace('C', '')
    $C = ($C * 1.8) + 32
    Write-Host $C
    #Write-Host $temp
}
elseif ($temp -match "^[0-9]*F$") {
    [int]$F = $temp.Replace('F', '')
    $F = ($F - 32) * 5 / 9
    Write-Host $F
}