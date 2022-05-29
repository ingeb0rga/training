$N = Read-Host "Введите значение N"
$temp = @(1, 1)
$fib = @(1, 1)
while (($temp[0] + $temp[1]) -lt $N) {
    $a = $temp[0]
    $temp[0] = $temp[0] + $temp[1]
    $temp[1] = $a
    $fib += $temp[0]
}

Write-Host $fib
