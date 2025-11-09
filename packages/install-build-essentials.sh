#!/bin/bash

case "$OS_TYPE" in
    mac)
        brew install cmake
        ;;
    arch)
        sudo pacman -S --noconfirm cmake make gcc
        ;;
    ubuntu)
        sudo apt-get install -y cmake build-essential
        ;;
esac
