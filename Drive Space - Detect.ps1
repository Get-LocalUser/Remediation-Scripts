# Get information about the C drive using WMI
$driveInfo = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }

# Calculate the size of the C drive in GB
$freespace = $([Math]::Floor($driveInfo.FreeSpace / 1GB))
$drivesize = $([Math]::Floor($driveInfo.Size / 1GB))
$tenPercentOfDrive = $drivesize * 0.10

# Create a multi-line string for the output
$output = @"
Size of drive: $drivesize"GB, Space remaining: $freespace GB, 10% of drive size: $tenPercentOfDrive GB
"@

# Print the output
Write-Output $output