$N = Read-Host "Введите значение N"
$temp = @(1, 0)
$fib = @(0, 1)
while (($temp[0] + $temp[1]) -lt $N) {
    $a = $temp[0]
    $temp[0] = $temp[0] + $temp[1]
    $temp[1] = $a
    $fib += $temp[0]
}

Write-Host $fib