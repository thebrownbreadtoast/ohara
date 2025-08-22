#!/bin/bash

echo "Installing required packages..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

bash "$SCRIPT_DIR/install-docker.sh"
sudo apt-get install -y docker-compose samba git vim

ln -sf "$SCRIPT_DIR/.bashrc" "$HOME_DIR/.bashrc"
ln -sf "$SCRIPT_DIR/.bash_profile" "$HOME_DIR/.bash_profile"

echo "Setup complete. Symlinks created for .bashrc and .bash_profile."
