$text = Get-Content C:\temp\txt.txt
$words = $text.Split().ToLower() | sort

$array = @()
[char]"A"..[char]"Z" | ForEach-Object { $array += @([char]$_) }

foreach ($word in $words) {
    foreach ($i in $array) {
        if ($word -match "^"+$i) {$word | Add-Content C:\temp\$i.txt}
    }
}

#foreach ($i in $array) {Get-Content C:\temp\$i.txt  | sort | Set-Content C:\temp\$i.txt}