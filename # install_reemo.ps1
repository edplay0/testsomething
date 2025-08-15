Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Disable-NetAdapter -Name $_.Name -Confirm:$false }
Start-Sleep -Seconds 60
Get-NetAdapter | Where-Object { $_.Status -eq 'Disabled' } | ForEach-Object { Enable-NetAdapter -Name $_.Name -Confirm:$false }
Invoke-WebRequest -Uri "https://download.reemo.io/reemo.setup.x64.exe" -OutFile "$env:TEMP\reemo.setup.x64.exe"
$id = "a8061f5679cd"
$id | Set-Clipboard
$id
Start-Process "$env:TEMP\reemo.setup.x64.exe"
[void][System.Console]::ReadKey($true)
shutdown /l
