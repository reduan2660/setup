#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install ripgrep
        ;;
    arch)
        sudo pacman -S --noconfirm ripgrep
        ;;
    ubuntu)
        sudo apt-get install -y ripgrep
        ;;
esac
