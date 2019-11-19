#!/bin/sh

. utils.sh

brew_cask_install slack
brew_cask_install sublime-text
brew_cask_install iterm2
brew_cask_install spotify
brew_cask_install google-chrome
brew_cask_install lastpass

# screensaver
brew_cask_install aerial
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver/ type 0
