$LogsFolder = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
$Minidump_Folder = "C:\Windows\Minidump"

if (Test-Path $Minidump_Folder) {
    $Last_DMP = Get-Childitem $Minidump_Folder | where {$_.Extension -eq ".dmp"} | Sort-Object -Descending -Property LastWriteTime | Select -First 1
    Copy-Item $Last_DMP.FullName -Destination $LogsFolder
} 

$DestinationPath = Join-Path $LogsFolder $Last_DMP.Name
if (Test-Path $DestinationPath) {
    Write-Output "File copied to Logs folder successfully."
}