param(
    [Parameter(Mandatory)]
    [string]$path
)
# Getting the content from account.csv file
$accounts = Get-Content -Path $path | ConvertFrom-Csv    

# Optional: Get the Path from console, check if account.csv file is present and read it's content
# $path = Read-Host 'Enter the path to accounts.csv, ending with "\" (eg: C:\)'
# if ( (Get-ChildItem -Path $path) -match "accounts.csv") {
#     $accounts = Get-Content -Path $path"accounts.csv" | ConvertFrom-Csv    
# }
# else {
#     Write-Host "File not found. Wrong path or missing file.)"
# }

$hash = @{}     # Hashtable with IDs of equal email addresses
foreach ($account in $accounts) {
    # Formatting "name" column as required ("Name Sirname")
    $account.name = (Get-Culture).TextInfo.ToTitleCase($account.name)
    # Email generator without adding location_id and domain
    $account.email = ([string]$account.name[0]).ToLower() + (([string]$accounts[$accounts.IndexOf($account)].name).Split(' ')[1]).ToLower()
    # This block will fill make a hashtable with all emails as keys and all IDs as key values
    if ($hash.ContainsKey($account.email)) {
        $hash[$account.email] += @($account.id)
    }
    else {
        $hash.Add($account.email, @($account.id))
    }
}

# Formatting not unique email addresses (adding location_id (where needed) and domain)
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

# Saving the converted/formatted accounts_new.csv file into the directory with initial Path
$accounts | ConvertTo-Csv | Set-Content -Path $path.Replace('accounts.csv', 'accounts_new.csv')

# Optional save, if reading Path from console
# $accounts | ConvertTo-Csv | Set-Content -Path $path"accounts_new.csv"