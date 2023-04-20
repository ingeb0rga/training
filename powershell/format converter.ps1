$processes = Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize

#Создаем hashtable из массива
$hash = foreach ($process in $processes) { @{$processes.IndexOf($process) = @{Name = "$($process.Name)"; Id = "$($process.Id)"; StartTime = "$($process.StartTime)"; PagedMemorySize = "$($process.PagedMemorySize)"} } }

#Сохраняем массив в .csv
$processes | ConvertTo-Csv | Set-Content -Path .\demo.csv

#Сохраняем массив в .json
$processes | ConvertTo-Json | Set-Content -Path .\demo.json

#Типизируем и сохраняем массив в .xml
([xml]$($processes | ConvertTo-Xml -Depth 2)).Save( $(Resolve-Path .\).Path + ".\demo.xml" )

#Сохраняем массив в .yaml
ConvertTo-Yaml -Data $hash -OutFile $($(Resolve-Path .\).Path + ".\demo.yaml") -Force

#Читаем .csv и создаем hashtable
$csvdata = Get-Content -Path .\demo.csv | ConvertFrom-Csv
$csvhash = foreach ($line in $csvdata) { @{$csvdata.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

#Читаем .json и создаем hashtable
$jsondata = Get-Content -Path .\demo.json | ConvertFrom-Json
$jsonhash = foreach ($line in $jsondata) { @{$jsondata.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

#Читаем .xml и создаем hashtable
$xmldata = [xml]$(Get-Content -Path .\demo.xml)
$xmlhash = foreach ($line in $xmldata.Objects.Object) { @{$xmldata.Objects.Object.IndexOf($line) = @{Name = "$($line.Name)"; Id = "$($line.Id)"; StartTime = "$($line.StartTime)"; PagedMemorySize = "$($line.PagedMemorySize)"} } }

#Читаем .yaml hashtable
$yamlhash = ConvertFrom-Yaml -Yaml $( $(Get-Content .\demo.yaml) -join "`n" )