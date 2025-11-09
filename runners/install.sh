#!/bin/bash

export OS_TYPE=""
export SHELL_RC=""

if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="mac"
    export SHELL_RC=""
elif command -v pacman &> /dev/null; then
    OS_TYPE="arch"
    SHELL_RC="$HOME/.bashrc"
elif command -v apt-get &> /dev/null; then
    OS_TYPE="ubuntu"
    sudo apt-get update
    SHELL_RC="$HOME/.bashrc"
fi

export OS_TYPE

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$SCRIPT_DIR/../packages"

source "$PACKAGES_DIR/install-build-essentials.sh"
source "$PACKAGES_DIR/install-git.sh"
source "$PACKAGES_DIR/install-tmux.sh"
source "$PACKAGES_DIR/install-tree.sh"
source "$PACKAGES_DIR/install-ripgrep.sh"
source "$PACKAGES_DIR/install-stow.sh"
source "$PACKAGES_DIR/install-neovim.sh"
source "$PACKAGES_DIR/install-language-servers.sh"
