#!/usr/bin/env bash

pushd $HOME/Code/dotfiles/stow
stow --verbose --target=$HOME --no-folding ssh
stow --verbose --target=$HOME --no-folding scripts
stow --verbose --target=$HOME --no-folding tmux
stow --verbose --target=$HOME --no-folding zsh
stow --verbose --target=$HOME --no-folding kitty
stow --verbose --target=$HOME --no-folding yazi
stow --verbose --target=$HOME --no-folding wezterm
stow --verbose --target=$HOME --no-folding dinit
stow --verbose --target=$HOME --no-folding hypr
stow --verbose --target=$HOME --no-folding fish
stow --verbose --target=$HOME --no-folding i3
stow --verbose --target=$HOME --no-folding git
popd
