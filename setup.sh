#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running installation script..."
source "$SCRIPT_DIR/runners/install.sh"

echo "Running configuration script..."
source "$SCRIPT_DIR/runners/config.sh"

echo "Setup complete!"
