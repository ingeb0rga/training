function SortFileSize {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$folder
    )
    
    begin {}
    process {Get-ChildItem -Path $folder -Recurse | Sort-Object Length -Descending | Select-Object Name,Length -first 10}
    end {}
}