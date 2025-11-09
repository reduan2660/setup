#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install go
        ;;
    arch)
        sudo pacman -S --noconfirm go
        ;;
    ubuntu)
        sudo apt-get install -y golang-go
        ;;
esac
