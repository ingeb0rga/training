$n = Read-Host "Введите возраст собаки (лет)"
Write-Host

$age = 0

switch ($n) {
    1 {$age = 10.5}
    2 {$age = 21}
    {$_ -gt 2}  {for ($i = 1; $i -le $n - 2; $i++ ) {$age += 4}
                    $age = $age + 21
                }
}

Write-Host "Возраст собаки, в переводе на человеческий:" $age "лет."