$text = (Get-Content C:\temp\txt.txt).ToLower()
$words = $text.Split().ToLower().Replace(',','').Replace('.','') | sort -Unique
$hash = @{}

foreach ($word in $words) {
    if ($hash.ContainsKey($word) ) {continue}
    else {$hash.Add($word, $word.Length)}
}

$hash.GetEnumerator() | Sort-Object -Property Name | Sort-Object -Property Value -Descending | select -First 10 > C:\temp\10_longest_words.txt