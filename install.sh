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

source "./packages/install-build-essentials.sh"
source "./packages/install-tmux.sh"
source "./packages/install-tree.sh"
source "./packages/install-ripgrep.sh"
source "./packages/install-go.sh"
source "./packages/install-language-servers.sh"
