#!/bin/bash
#
# Install Papirus-Pixel for the current user from the latest release of
# cassius66/papirus-pixel, into ~/.local/share/icons.
#
# Usage
#   bash install.sh              install, or update to the latest release
#   bash install.sh --uninstall  remove it
#
# Papirus-Pixel inherits from Papirus-Dark, so Papirus must be installed first.

set -euo pipefail

REPO=cassius66/papirus-pixel
NAME=Papirus-Pixel
# Not $XDG_DATA_HOME: launchers that scan icon folders by path, such as
# Omarchy's, look in ~/.local/share/icons whatever that variable says.
DEST="$HOME/.local/share/icons"
URL="https://github.com/$REPO/releases/latest/download/$NAME.tar.gz"

if [[ ${1:-} == "--uninstall" ]]; then
  rm -rf "${DEST:?}/$NAME"
  echo "Removed $DEST/$NAME"
  exit 0
fi

base=false
for dir in "$DEST" "$HOME/.icons" /usr/local/share/icons /usr/share/icons; do
  [[ -f $dir/Papirus-Dark/index.theme ]] && base=true
done
if [[ $base == false ]]; then
  echo "Papirus-Pixel inherits from Papirus-Dark, which is not installed." >&2
  echo "Install it first, on Arch: sudo pacman -S papirus-icon-theme" >&2
  exit 1
fi

# Unpack beside the destination so the final mv is a rename. A copy from
# another filesystem can reverse the folder order the archive was built with.
mkdir -p "$DEST"
tmp=$(mktemp -d "$HOME/.local/share/.papirus-pixel.XXXXXX")
trap 'rm -rf "$tmp"' EXIT

echo "Downloading $URL"
curl -fsSL "$URL" | tar -xz -C "$tmp"
if [[ ! -f $tmp/$NAME/index.theme ]]; then
  echo "The release archive has no $NAME/index.theme" >&2
  exit 1
fi

rm -rf "${DEST:?}/$NAME"
mv "$tmp/$NAME" "$DEST/$NAME"
if command -v gtk-update-icon-cache >/dev/null; then
  gtk-update-icon-cache -q "$DEST/$NAME" || true
fi

echo "Installed $NAME into $DEST"
echo "Select it with: gsettings set org.gnome.desktop.interface icon-theme $NAME"
