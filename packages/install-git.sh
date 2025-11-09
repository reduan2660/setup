#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install git
        ;;
    arch)
        sudo pacman -S --noconfirm git
        ;;
    ubuntu)
        sudo apt-get install -y git
        ;;
esac
