$processes = Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize
$hash = foreach ($process in $processes) { @{$processes.IndexOf($process) = @{Name = "$($process.Name)"; Id = "$($process.Id)"; StartTime = "$($process.StartTime)"; PagedMemorySize = "$($process.PagedMemorySize)"} } }

$processes | ConvertTo-Csv | Set-Content -Path .\demo.csv

$processes | ConvertTo-Json | Set-Content -Path .\demo.json

#$xml = [xml]$($processes | ConvertTo-Xml -Depth 2)
#$xml.Save( $(Resolve-Path .\).Path + ".\demo.xml" )
([xml]$($processes | ConvertTo-Xml -Depth 2)).Save( $(Resolve-Path .\).Path + ".\demo.xml" )

ConvertTo-Yaml -Data $hash -OutFile $($(Resolve-Path .\).Path + ".\demo.yaml") -Force

$csvdata = Get-Content -Path .\demo.csv | ConvertFrom-Csv
$csvhash = foreach ($line in $csvdata) { @{$csvdata.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

$jsondata = Get-Content -Path .\demo.json | ConvertFrom-Json
$jsonhash = foreach ($line in $jsondata) { @{$jsondata.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

$xmldata = [xml]$(Get-Content -Path .\demo.xml)
$xmlhash = foreach ($line in $xmldata.Objects.Object) { @{$xmldata.Objects.Object.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

$yamlhash = ConvertFrom-Yaml -Yaml $( $(Get-Content .\demo.yaml) -join "`n" )