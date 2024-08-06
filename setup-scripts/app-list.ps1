# Define the URL of the JSON file and the local path for the temporary file
$jsonUrl = "https://raw.githubusercontent.com/Mabc365/xube-toolbox/main/setup-scripts/app-list.json"
$tempFile = "$env:TEMP\app-list.json"

# Download the JSON file from the URL
Invoke-WebRequest -Uri $jsonUrl -OutFile $tempFile

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

# Remove the script file itself
Remove-Item -Path $MyInvocation.MyCommand.Definition -Force
