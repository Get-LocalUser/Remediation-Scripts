$Minidump_Folder = "C:\Windows\Minidump"
if (Test-Path $Minidump_Folder) {
    if ($child = Get-ChildItem $Minidump_Folder -File) {
        Write-Output "DMP files found"
        Exit 1
    }
} else {
    Write-Output "No DMP files found"
    Exit 0
}