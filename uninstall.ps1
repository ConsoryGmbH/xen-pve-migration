
Write-Host "#######################################"
Write-Host ""
Write-Host "  XenDriver Uninstaller"
Write-Host ""
Write-Host "#######################################"
Write-Host ""
Write-Host "  Enter your Admin Username"

$Username = Read-Host -Prompt "    "

Write-Host ""
Write-Host "#######################################"
Write-Host ""
Write-Host "  removing xen-tools"
Write-Host ""

Uninstall-Package -Name "Citrix XenServer Windows Management Agent" -Force

Write-Host ""
Write-Host "#######################################"
Write-Host ""
Write-Host "  stopping services"
Write-Host ""

sc.exe stop xenagent
sc.exe stop xenbus_monitor

Write-Host "  deleting services"
Write-Host ""

sc.exe delete xenagent
sc.exe delete xenbus_monitor

Write-Host ""
Write-Host "#######################################"
Write-Host ""
