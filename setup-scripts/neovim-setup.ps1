#Installing Neovim
winget install Neovim.Neovim
scoop install gcc

# Define the Neovim config directory
$nvimConfigDir = "$env:USERPROFILE\AppData\Local\nvim"

if (Test-Path $nvimConfigDir) {
    Write-Output "Attempting to delete existing Neovim config directory..."
    try {
        # Check if the directory is in use
        $inUse = Get-Process | Where-Object { $_.Modules.FileName -like "$nvimConfigDir\*" }
        if ($inUse) {
            Write-Output "The Neovim config directory is in use by another process. Please close any applications using it and try again."
            exit
        }

        Remove-Item -Path $nvimConfigDir -Recurse -Force
        Write-Output "Neovim config directory deleted."
    } catch {
        Write-Output "Failed to delete Neovim config directory. Error: $_"
        Write-Output "Please ensure you have the necessary permissions or manually remove the directory."
        exit
    }
} else {
    Write-Output "Neovim config directory does not exist. Proceeding with cloning..."
}

#Installing Neovim theming
git clone --branch xvim https://github.com/Mabc365/xube-toolbox.git $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim