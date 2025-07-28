#!/bin/sh

echo 'Installing personal applications...'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
whatsapp \
spotify \
nordvpn \
philips-hue-sync \
sonos

echo 'Personal applications installed successfully!' 