function Write-ColoredMessage {
    param (
        [string]$Text = "Hi",
        [switch]$Red,
        [switch]$Blue
    )
    if ($Red) {
        Write-Host $Text  -ForegroundColor Red
    }
    elseif ($Blue) {
        Write-Host $Text  -ForegroundColor Blue
    }
    else {
        Write-Host $Text
    }
}