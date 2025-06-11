#!/bin/bash

original_files=(
  "$HOME/.config/fish/config.fish"
  "$HOME/.config/wezterm/wezterm.lua"
  "$HOME/.config/lsd/config.yml"
)

backup_files=(
  "fish/config.fish"
  "wezterm/wezterm.lua"
  "lsd/config.yml"
)

for i in "${!original_files[@]}"; do
  orig="${original_files[$i]}"
  backup="${backup_files[$i]}"

  # Create backup directory if missing
  mkdir -p "$(dirname "$backup")"

  # Copy original to backup (always overwrite, or you can add conditions)
  cp "$orig" "$backup"
  echo "Copied $orig to $backup"
done
