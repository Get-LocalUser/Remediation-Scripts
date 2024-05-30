$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore"
$registryKey = "RPSessionInterval"
$desiredValue = 1

try {
    $currentValue = Get-ItemProperty -Path $registryPath -Name $registryKey -ErrorAction Stop

    if ($currentValue.$registryKey -eq $desiredValue) {
        Write-Host "RPSessionInterval is set to $desiredValue/Script will exit"
        Exit 0
    } else {
    # Turn on System Protection
    Enable-ComputerRestore -Drive "C:"

    # Set the maximum disk space usage for System Restore to 10 percent
    $percentage = 10
    $driveLetter = "C:"

    # Get the total size of the drive
    $driveSize = (Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$driveLetter'").Size

    # Calculate the maximum size in MB that System Restore should use
    $maxSize = ($driveSize * $percentage / 100) / 1MB

    # Run vssadmin to resize the shadowstorage
    Invoke-Expression -Command "vssadmin Resize ShadowStorage /On=$driveLetter /For=$driveLetter /MaxSize=${maxSize}MB"
    }
} catch {
    Write-Host "Error accessing registry key: $($_.Exception.Message)"
    Exit 1
}
