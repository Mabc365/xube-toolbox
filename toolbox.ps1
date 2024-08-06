function Show-Menu {
    param (
        [string]$Title = "Select an option"
    )
    cls
    Write-Host $Title -ForegroundColor Cyan
    Write-Host "1: Powershell Setup"
    Write-Host "2: Run Script 2"
    Write-Host "3: Exit"
}

function Run-Script {
    param (
        [string]$ScriptPath
    )
    if (Test-Path $ScriptPath) {
        . $ScriptPath
    } else {
        Write-Host "Script not found!" -ForegroundColor Red
    }
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' { Run-Script "" }
        '2' { Run-Script "C:\Path\To\Script2.ps1" }
        '3' { Write-Host "Exiting..." -ForegroundColor Green; exit }
        default { Write-Host "Invalid option, try again." -ForegroundColor Red }
    }
} while ($choice -ne '3')
