$text = (Get-Content C:\temp\txt.txt).ToLower()
$words = $text.Split()
$hash = @{}

foreach ($word in $words) {
    if ($word -match "$null") {
        if ($hash.ContainsKey($word)) {
            $hash[$word] += 1
        }
        else {
            $hash.Add($word, 1)
        }
    }
}

$hash.GetEnumerator() | Sort-Object -Property Value -Descending | select -First 10