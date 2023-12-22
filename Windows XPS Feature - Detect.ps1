try {
    $Feature = Get-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features"
    if ($Feature.State -eq "Enabled") {
        Write-Host "Feature is enabled"
        Exit 0
    } 
    Write-Warning "Feature is not enabled"
    Exit 1
}
catch {
    Write-Warning "Not Enabled"
    Exit 1
}
