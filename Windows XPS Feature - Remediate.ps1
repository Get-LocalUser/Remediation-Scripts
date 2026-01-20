try {
    $Feature = Enable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features"
    if ($Feature.state -ne "Enabled") {
        Write-Output "Feature failed to enable"
        Exit 0
    }
}
catch {
    Write-Output "Not Enabled"
    Exit 1
}

