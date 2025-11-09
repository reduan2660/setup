#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/../dotfiles"
CONFIG_DIR="$HOME/.config"

for dotfile in "$DOTFILES_DIR"/*; do
    if [ -d "$dotfile" ]; then
        dotfile_name=$(basename "$dotfile")
        target="$CONFIG_DIR/$dotfile_name"

        # Remove existing config if it exists
        if [ -e "$target" ] || [ -L "$target" ]; then
            echo "Removing existing: $target"
            rm -rf "$target"
        fi

        # Create symlink
        echo "Linking: $target -> $dotfile"
        ln -s "$dotfile" "$target"
    fi
done

cd "$SCRIPT_DIR"
