#!/bin/sh

echo 'Creating symlinks...'

ln -sfn ~/.dotfiles/zsh ~/.config/zsh
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
ln -sfn ~/.dotfiles/gh ~/.config/gh
ln -sfn ~/.dotfiles/karabiner ~/.config/karabiner
ln -sfn ~/.dotfiles/hammerspoon ~/.hammerspoon

echo "Done."
