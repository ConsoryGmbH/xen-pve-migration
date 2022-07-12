
Write-Host "#######################################"
Write-Host ""
Write-Host "  XenDriver Cleanup"
Write-Host ""
Write-Host "#######################################"
Write-Host ""
Write-Host "  Enter your Admin Username"

$Username = Read-Host -Prompt "    "

Write-Host ""
Write-Host "#######################################"
Write-Host ""
Write-Host "  deleting drivers"
Write-Host ""


$NewOwner = New-Object System.Security.Principal.NTAccount($Username)
$FolderAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($Username, 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$FileAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($Username, 'FullControl', 'Allow')


$FolderList = Get-ChildItem -Path "C:\Windows\System32" -Filter "xen*" -Recurse | Where-Object {$_.PSIsContainer -eq $true}

foreach ($Folder in $FolderList)
{
    $ACL = Get-ACL $Folder.FullName

    $ACL.SetOwner($NewOwner)
    $ACL.SetAccessRule($FolderAccessRule)

    Set-Acl -Path $Folder.FullName -AclObject $ACL

    Remove-Item -Path $Folder.FullName -Recurse
}


$FileList = Get-ChildItem -Path "C:\Windows\System32" -Filter "xen*" -Recurse | Where-Object {$_.PSIsContainer -eq $false}

foreach ($File in $FileList)
{
    $ACL = Get-ACL $File.FullName

    $ACL.SetOwner($NewOwner)
    $ACL.SetAccessRule($FileAccessRule)

    Set-Acl -Path $File.FullName -AclObject $ACL

    Remove-Item -Path $File.FullName
}
