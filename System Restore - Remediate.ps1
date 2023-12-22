Try {
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
} Catch {
    Write-Host "Something IO went wrong: $($_.exception.message)"
    }