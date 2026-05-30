#!/usr/bin/env bash

set -euo pipefail

# Script name : uninstall.sh
# Description : Uninstall waybar-switcher and restore the current config

BINARY="waybar-switcher"
INSTALL_PATH="/usr/local/bin/$BINARY"
CONFIG_DIR="$HOME/.config/waybar-configs"
WAYBAR_LINK="$HOME/.config/waybar"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Check if installed
if [[ ! -f "$INSTALL_PATH" ]]; then
  echo -e "${YELLOW}${BOLD}[WARNING]${RESET} waybar-switcher is not installed at $INSTALL_PATH"
  exit 0
fi

# Resolve the current active config (what the symlink points to)
if [[ -L "$WAYBAR_LINK" ]]; then
  ACTIVE_CONFIG="$(readlink -f "$WAYBAR_LINK")"
  # Remove the symlink
  rm "$WAYBAR_LINK"
  # Replace it with the actual config directory
  cp -r "$ACTIVE_CONFIG" "$WAYBAR_LINK"
  echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} Restored active config to $WAYBAR_LINK"
elif [[ -d "$WAYBAR_LINK" ]]; then
  echo -e "${YELLOW}${BOLD}[WARNING]${RESET} ~/.config/waybar is already a real directory, nothing to restore"
else
  echo -e "${YELLOW}${BOLD}[WARNING]${RESET} ~/.config/waybar not found, skipping restore"
fi

# Remove binary
sudo rm -f "$INSTALL_PATH"

echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} Uninstall complete"
echo -e "${BLUE}${BOLD}[INFO]${RESET} Your other configs in ${CONFIG_DIR} were left untouched."