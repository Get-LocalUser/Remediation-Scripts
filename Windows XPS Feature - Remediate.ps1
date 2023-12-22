try {
    $Feature = Enable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features"
    if ($Feature.state -ne "Enabled") {
        Write-Host "Feature failed to enable"
        Exit 0
    }
}
catch {
    Write-Warning "Not Enabled"
    Exit 1
}
