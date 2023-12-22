try {
    $TeamsPath1 = Test-Path -Path ($env:APPDATA + "\Microsoft\Teams")
    if ($TeamsPath1) {
        Write-Output "Teams cache folder exists"
        Exit 1
    }
    else {
        Write-Error "Teams cache folder does not exist"
        Exit 0
    }
}
catch {
    Write-Error "An error occurred: $_"
    Exit 0
}
