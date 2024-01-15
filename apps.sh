#!/bin/sh

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
slack \
sublime-text \
iterm2 \
spotify \
google-chrome \
1password \
aerial \
whatsapp \
nordvpn \
avast-security \
philips-hue-sync \
sonos \
zoom

defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver/ type 0
