#!/bin/sh

echo ""
echo '------------------------------------'
echo 'Apps (1/1): Installing personal apps'
echo '------------------------------------'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
whatsapp \
spotify \
nordvpn \
philips-hue-sync \
sonos
