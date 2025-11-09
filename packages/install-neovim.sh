#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install neovim
        ;;
    arch)
        sudo pacman -S --noconfirm neovim
        ;;
    ubuntu)
        sudo apt-get install -y neovim
        ;;
esac
