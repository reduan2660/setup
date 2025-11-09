#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install tmux
        ;;
    arch)
        sudo pacman -S --noconfirm tmux
        ;;
    ubuntu)
        sudo apt-get install -y tmux
        ;;
esac
