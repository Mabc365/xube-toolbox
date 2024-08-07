function Show-Menu {
    param (
        [string]$Title = "Select an option"
    )
    cls
    Write-Host $Title -ForegroundColor Cyan
    Write-Host "1: Setup Powershell Profile"
    Write-Host "2: Run Script from URL 2"
    Write-Host "3: Exit"
}

function Run-Command {
    param (
        [string]$Url
    )
    try {
        $command = Invoke-RestMethod -Uri $Url
        Invoke-Expression $command
    } catch {
        Write-Host "Failed to fetch or execute command from $Url" -ForegroundColor Red
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' { Run-Command "https://raw.githubusercontent.com/Mabc365/xube-toolbox/main/setup-scripts/powershell-setup.ps1" }
        '2' { Run-Command "https://example.com/script2.ps1" }
        '3' { Write-Host "Exiting..." -ForegroundColor Green; exit }
        default { Write-Host "Invalid option, try again." -ForegroundColor Red }
    }
} while ($choice -ne '3')
