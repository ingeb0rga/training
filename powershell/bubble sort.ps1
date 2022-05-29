$var = Read-Host "Verbose? (y/n)"
if ($var -match 'y|yes|Yes|Y|YES') {
    $VerbosePreference = 'Continue'
}
elseif ($var -match 'n|no|N|NO') {
    $VerbosePreference = 'SilentlyContinue'
}

$list = @()
for ($i=1; $i -le 20; $i++) {
    $list += Get-Random -Minimum 1 -Maximum 100
}

Write-Host
Write-Host "Initial list:"
foreach ($s in $list) {Write-Host "$s " -NoNewline}
Write-Host

for ($a=1; $a -lt $list.Length; $a++) {
    for ($b=0; $b -lt ($list.Length - 1); $b++) {
        if ($list[$b] -ge $list[$b + 1]) {
            $temp = $list[$b]
            $list[$b] = $list[$b + 1]
            $list[$b + 1] = $temp
        }
        Write-Verbose "$list"
        
    }
}

Write-Host
Write-Host "Bubble sorted list:"
foreach ($s in $list) {Write-Host "$s " -NoNewline -Verbose}
Write-Host