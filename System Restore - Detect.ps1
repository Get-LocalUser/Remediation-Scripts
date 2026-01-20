$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore"
$registryKey = "RPSessionInterval"
$desiredValue = 1

try {
    $currentValue = Get-ItemProperty -Path $registryPath -Name $registryKey -ErrorAction Stop

    if ($currentValue.$registryKey -eq $desiredValue) {
        Write-Output "RPSessionInterval is set to $desiredValue/Script will exit"
        Exit 0
    } else {
        Write-Output "System Protection not enabled."
        Exit 1
    }
} catch {
    Write-Output "Error accessing registry key: $($_.Exception.Message)"
    Exit 1

}
