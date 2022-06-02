$var = Read-Host "Verbose? (y/n)"
$ArrayLength = Read-Host "Enter the number sequence length"

#Сохраняем начальное состояние $VerbosePreference
$VerbosePreferenceState = $VerbosePreference

if ($var -match 'y|yes|Y|Yes|YES') {
    $VerbosePreference = 'Continue'
}
elseif ($var -match 'n|no|N|No|NO') {
    $VerbosePreference = 'SilentlyContinue'
}

$sequence = @()
for ($i=1; $i -le $ArrayLength; $i++) {
    $sequence += Get-Random -Minimum 1 -Maximum 100
}

Write-Host
Write-Host "Initial sequence:"
foreach ($i in $sequence) {Write-Host "$i " -NoNewline}
Write-Host

for ($a=1; $a -lt $sequence.Length; $a++) {
    for ($b=0; $b -lt ($sequence.Length - 1); $b++) {
        if ($sequence[$b] -ge $sequence[$b + 1]) {
            $temp = $sequence[$b]
            $sequence[$b] = $sequence[$b + 1]
            $sequence[$b + 1] = $temp
        }
        Write-Verbose "$sequence"
        
    }
}

Write-Host
Write-Host "Bubble sorted sequence:"
foreach ($i in $sequence) {Write-Host "$i " -NoNewline -Verbose}
Write-Host

#Возвращаем первоначальное состояние $VerbosePreference
$VerbosePreference = $VerbosePreferenceState