#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running installation script..."
source "$SCRIPT_DIR/runners/install.sh"

echo "Running configuration script..."
source "$SCRIPT_DIR/runners/config.sh"

echo "Running shell setup script..."
bash "$SCRIPT_DIR/scripts/setup.sh"

echo "Setup complete!"
