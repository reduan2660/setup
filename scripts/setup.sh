#!/bin/bash

set -e

case "$SHELL" in
    */zsh) CONFIG="$HOME/.zshrc" ;;
    */bash) CONFIG="$HOME/.bashrc" ;;
    *) exit 1 ;;
esac

[ ! -f "$CONFIG" ] && touch "$CONFIG"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="${SCRIPT_DIR}/shell/aliases"

NEW_CONTENT=""

while IFS= read -r line || [ -n "$line" ]; do
    [[ -z "$line" ]] || [[ "$line" =~ ^[[:space:]]*# ]] && continue

    if [[ "$line" =~ ^alias[[:space:]]+([^=]+)= ]]; then
        ALIAS_NAME="${BASH_REMATCH[1]}"
        grep -q "^alias ${ALIAS_NAME}=" "$CONFIG" 2>/dev/null || NEW_CONTENT="${NEW_CONTENT}${line}\n"
    fi
done < "$ALIASES_FILE"

[ -n "$NEW_CONTENT" ] && echo -e "$NEW_CONTENT" >> "$CONFIG"
