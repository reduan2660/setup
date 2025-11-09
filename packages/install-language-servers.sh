#!/bin/bash

# Install language servers: lua_ls, gopls, pyright

case "$OS_TYPE" in
    mac)
        brew install lua-language-server
        ;;
    arch)
        sudo pacman -S --noconfirm lua-language-server
        ;;
    ubuntu)
        # lua-language-server not in apt, install from source
        if ! command -v lua-language-server &> /dev/null; then
            echo "Installing lua-language-server from source..."
            cd /tmp
            git clone https://github.com/LuaLS/lua-language-server
            cd lua-language-server
            ./make.sh
            sudo cp -r bin/lua-language-server /usr/local/bin/
            cd ~
        fi
        ;;
esac

# Install gopls
if ! command -v gopls &> /dev/null; then
    go install golang.org/x/tools/gopls@latest
fi

# Install pyright
case "$OS_TYPE" in
    mac)
        brew install pyright
        ;;
    arch)
        sudo pacman -S --noconfirm pyright
        ;;
    ubuntu)
        if ! command -v npm &> /dev/null; then
            sudo apt-get install -y npm
        fi
        sudo npm install -g pyright
        ;;
esac

# Add ~/go/bin to PATH if not already present
if ! grep -q 'export PATH="$HOME/go/bin:$PATH"' "$SHELL_RC"; then
    echo 'export PATH="$HOME/go/bin:$PATH"' >> "$SHELL_RC"
    echo "Added ~/go/bin to PATH in $SHELL_RC"
fi

echo "Language servers installed. Restart your shell or run: source $SHELL_RC"
