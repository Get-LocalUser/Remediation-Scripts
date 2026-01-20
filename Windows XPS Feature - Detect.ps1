try {
    $Feature = Get-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features"
    if ($Feature.State -eq "Enabled") {
        Write-Output "Feature is enabled"
        Exit 0
    } 
    Write-Output "Feature is not enabled"
    Exit 1
}
catch {
    Write-Output "Not Enabled"
    Exit 1
}

