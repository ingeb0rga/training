# Get the Path from console
$path = Read-Host 'Enter the path to accounts.csv, ending with "\" (eg: C:\)'
# Check if account.csv file is present and get it's content
if ( (Get-ChildItem -Path $path) -match "accounts.csv") {
    $accounts = Get-Content -Path $path"accounts.csv" | ConvertFrom-Csv    
}
else {
    Write-Host "File not found. Maybe the wrong path entered.)"
}

$hash = @{}     # Hashtable with ID's of equal email addresses
foreach ($account in $accounts) {
    # Format/update "name" column
    $account.name = (Get-Culture).TextInfo.ToTitleCase($account.name)
    # Email generator
    $account.email = ([string]$account.name[0]).ToLower() + (([string]$accounts[$accounts.IndexOf($account)].name).Split(' ')[1]).ToLower()
        
    # Optional email generator (without force index incrementation), if ID column is unique and incremented by 1 with every record
    #$account.email = ([string]$account.name[0]).ToLower() + (([string]$accounts[($account.id - 1)].name).Split(' ')[1]).ToLower()
    
    # Find unique and not unique email addresses
    if ($hash.ContainsKey($account.email)) {
        $hash[$account.email] += @($account.id)
    }
    else {
        $hash.Add($account.email, @($account.id))
    }
}

# Format not unique email addresses and add domain
foreach ($i in $hash.Keys) {
    foreach ($j in $hash.$i) {
        if ($hash[$i].Length -eq 1) {       # Check if email address is unique
            $accounts[$j - 1].email = $accounts[$j - 1].email + "@abc.com"
        }
        elseif ($hash[$i].Length -gt 1) {   # Check if email address not unique
            $accounts[$j - 1].email = $accounts[$j - 1].email + $accounts[$j -1].location_id + "@abc.com"
        }
    }
}

# Save the converted/formatted accounts_new.csv file into the entered Path
$accounts | ConvertTo-Csv | Set-Content -Path $path"accounts_new.csv"