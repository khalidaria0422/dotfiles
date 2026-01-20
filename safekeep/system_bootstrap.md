# System Bootstrap / Installed Software

## Overview
This document lists the software and tools installed for a macOS system. It serves as reference for rebuilding the environment on a new machine. 

## App Store Applications
- Magnet
- Logic Pro
- Final Cut Pro
- Microsoft Excel

## Direct Downloads (Safari)
- Iterm2
- Karabiner
- Hammerspoon
- Zoom
- Discord
- R and RStudio

## Terminal / CLI Setup

### Core System
```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Shell Environment
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install eza
```

### Fonts
```sh
brew install --cask font-fira-code-nerd-font
```

### Editors
```sh
brew install neovim
```

### Version Control
```sh
brew install git
brew install gh
```

### Language Toolchains
```sh
brew install node
brew install llvm
brew install cmake
brew install python3
```

### Language Servers
```sh
brew install lua-language-server
```

### NPM
```sh
npm install -g live-server
npm install -g prettier
npm install -g eslint
npm install -g vscode-langservers-extracted
npm install -g typescript typescript-language-server
npm install -g @olrtg/emmet-language-server
npm install -g pyright
```

### Python (Neovim)
```sh
python3 -m venv ~/.venvs/nvim
source ~/.venvs/nvim/bin/activate
pip install --upgrade pip
pip install pynvim
```
