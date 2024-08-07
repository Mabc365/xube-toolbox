# Define the URL of the JSON file and the local path for the temporary file
$jsonUrl = "https://raw.githubusercontent.com/Mabc365/xube-toolbox/main/setup-scripts/app-list.json"
$tempFile = "$env:TEMP\app-list.json"

# Debugging output
Write-Output "Starting script execution..."
Write-Output "JSON URL: $jsonUrl"
Write-Output "Temporary file path: $tempFile"

# Download the JSON file from the URL with error handling
try {
    Invoke-WebRequest -Uri $jsonUrl -OutFile $tempFile -ErrorAction Stop
    $downloadSuccess = $true
    Write-Output "Download successful."
} catch {
    Write-Output "Failed to download JSON file. Error: $_"
    $downloadSuccess = $false
}

if ($downloadSuccess) {
    # Import applications using winget
    winget import -i $tempFile

    # Check if the import command was successful
    if ($LASTEXITCODE -eq 0) {
        Write-Output "Applications imported successfully."
    } else {
        Write-Output "Failed to import applications. Exit code: $LASTEXITCODE"
    }

    # Remove the temporary JSON file
    Remove-Item -Path $tempFile -Force
} else {
    Write-Output "Skipping application import due to download failure."
}

# Debugging output
Write-Output "Script file path: $MyInvocation.MyCommand.Definition"

# Remove the script file itself
Remove-Item -Path $MyInvocation.MyCommand.Definition -Force

Write-Output "Script execution completed."