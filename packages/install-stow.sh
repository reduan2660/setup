#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install stow
        ;;
    arch)
        sudo pacman -S --noconfirm stow
        ;;
    ubuntu)
        sudo apt-get install -y stow
        ;;
esac
