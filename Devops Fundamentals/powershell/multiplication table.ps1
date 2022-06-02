Write-Host
Write-Host "Таблица умножения"
Write-Host

for ($i=1; $i -le 9; $i++) {
    for ($j=1; $j -le 9; $j++) {
        Write-Host ($i * $j)`t -NoNewline
    }
    Write-Host
}