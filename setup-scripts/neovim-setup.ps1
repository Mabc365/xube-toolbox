#Installing Neovim
winget install Neovim.Neovim
scoop install gcc

#Installing Neovim Base Packages
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim

#Installing Neovim theming
git clone --branch xvim https://github.com/Mabc365/xube-toolbox.git $env:LOCALAPPDATA\nvim
