#!/bin/sh

brew cask install \
slack \
sublime-text \
iterm2 \
spotify \
google-chrome \
lastpass \
aerial 

defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver/ type 0
