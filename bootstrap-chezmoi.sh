#!/usr/bin/env bash
set -e

chezmoi_dir="$(pwd)/chezmoi"
if [ -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
  # replace sourceDir with the current directory if it exists
  if grep -q "sourceDir = " ~/.config/chezmoi/chezmoi.toml; then
    sed -i "s|sourceDir = .*|sourceDir = \"${chezmoi_dir}\"|" ~/.config/chezmoi/chezmoi.toml
  else
    echo "sourceDir = \"${chezmoi_dir}\"" >>~/.config/chezmoi/chezmoi.toml
  fi
else
  echo "sourceDir = \"${chezmoi_dir}\"" >~/.config/chezmoi/chezmoi.toml
fi
