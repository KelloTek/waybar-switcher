#!/usr/bin/env bash

set -euo pipefail

# Script name : install.sh
# Description : Install waybar-switcher from GitHub releases

REPO="KelloTek/waybar-switcher"
BINARY="waybar-switcher"
INSTALL_PATH="/usr/local/bin/$BINARY"
TMP_FILE="$(mktemp)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

cleanup() {
  rm -f "$TMP_FILE"
}
trap cleanup EXIT

# Detect OS
if [[ "$(uname -s)" != "Linux" ]]; then
  echo "Error: waybar-switcher is Linux only"
  exit 1
fi

# Verify dependencies
for cmd in curl sudo; do
  command -v "$cmd" &>/dev/null || { echo -e "${RED}${BOLD}[ERROR]${RESET} Dependency not found: $cmd"; exit 1; }
done

# Fetch latest release tag from GitHub API
echo -e "${BLUE}${BOLD}[INFO]${RESET} Fetching latest release..."
LATEST_TAG=$(
  curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" |
  grep '"tag_name"' |
  sed 's/.*"tag_name": *"\([^"]*\)".*/\1/'
)

if [[ -z "$LATEST_TAG" ]]; then
  echo -e "${RED}${BOLD}[ERROR]${RESET} Could not fetch latest release tag"
  exit 1
fi

DOWNLOAD_URL="https://github.com/$REPO/releases/download/$LATEST_TAG/$BINARY"

echo -e "${BLUE}${BOLD}[INFO]${RESET} Installing $BINARY $LATEST_TAG..."
curl -fL "$DOWNLOAD_URL" -o "$TMP_FILE"
chmod +x "$TMP_FILE"
sudo install -Dm755 "$TMP_FILE" "$INSTALL_PATH"

echo ""
echo -e "${GREEN}${BOLD}[SUCCESS]${RESET} waybar-switcher $LATEST_TAG installed to $INSTALL_PATH"
echo -e "${BLUE}${BOLD}[INFO]${RESET} Getting started: run waybar-switcher"
