#!/usr/bin/env bash

set -euo pipefail

# Script name : uninstall.sh
# Description : Uninstall waybar-switcher

BINARY="waybar-switcher"
INSTALL_PATH="/usr/local/bin/$BINARY"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
RESET='\033[0m'

# Check if installed
if [[ ! -f "$INSTALL_PATH" ]]; then
  echo -e "${YELLOW}${BOLD}[WARNING]${RESET} waybar-switcher is not installed at $INSTALL_PATH"
  exit 0
fi

# Confirm
read -rp "Remove waybar-switcher from $INSTALL_PATH? [y/N] " confirm
[[ "$confirm" =~ ^[yY]$ ]] || { echo -e "${RED}Aborted.${RESET}"; exit 0; }

# Remove binary
sudo rm -f "$INSTALL_PATH"
echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} waybar-switcher removed"

# Optionally remove configs
echo ""
read -rp "Also remove ~/.config/waybar-configs/ and ~/.config/waybar symlink? [y/N] " confirm_configs
if [[ "$confirm_configs" =~ ^[yY]$ ]]; then
  [[ -L "$HOME/.config/waybar" ]] && rm "$HOME/.config/waybar" && echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} Symlink removed"
  [[ -d "$HOME/.config/waybar-configs" ]] && rm -rf "$HOME/.config/waybar-configs" && echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} Config directory removed"
fi

echo ""
echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} Uninstall complete"