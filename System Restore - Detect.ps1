$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore"
$registryKey = "RPSessionInterval"
$desiredValue = 1

try {
    $currentValue = Get-ItemProperty -Path $registryPath -Name $registryKey -ErrorAction Stop

    if ($currentValue.$registryKey -eq $desiredValue) {
        Write-Host "RPSessionInterval is set to $desiredValue/Script will exit"
        Exit 0
    } else {
        Write-Host "System Protection not enabled."
        Exit 1
    }
} catch {
    Write-Host "Error accessing registry key: $($_.Exception.Message)"
    Exit 1
}