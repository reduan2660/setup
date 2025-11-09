#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install tree
        ;;
    arch)
        sudo pacman -S --noconfirm tree
        ;;
    ubuntu)
        sudo apt-get install -y tree
        ;;
esac
