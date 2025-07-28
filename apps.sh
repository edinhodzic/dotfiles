#!/bin/sh

echo ""
echo '-----------------------------------'
echo 'Apps (1/1): Installing general apps'
echo '-----------------------------------'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
slack \
sublime-text \
iterm2 \
brave-browser \
1password \
zoom \
avg-antivirus
