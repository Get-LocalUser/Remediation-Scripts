try {
    $Process = Get-Process -Name Teams, ms-teams -ErrorAction SilentlyContinue
    if ($Process) {
        Stop-Process $process
        Write-Output "MS Teams process has been killed"
    }

    $TeamsFolder = $env:APPDATA + "\Microsoft\Teams"
    Remove-Item -Path $TeamsFolder -Recurse -Force -ErrorAction SilentlyContinue
    if (-Not(Test-Path $TeamsFolder)) {
        Write-Output "Teams cache cleared"
    }
    else {
        Write-Error "Teams cache was not cleared"
    }
}
catch {
    Write-Error "An error occurred: $_"
}

Start-Sleep -Seconds 15
Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show(
    "The Teams cache folder has been cleared. You can now close this window and open up Teams again.",
    "Teams Cache Cleared",
    [System.Windows.MessageBoxButton]::OK,
    [System.Windows.MessageBoxImage]::Information
)
