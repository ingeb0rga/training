Remove-Variable words
$text = Get-Content C:\temp\txt.txt
$words = $text.Split().ToLower() | sort -Unique
$words