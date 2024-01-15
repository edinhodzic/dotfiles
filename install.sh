#!/bin/sh

# brew and git are prerequisites
if ! type brew &> /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

if ! type git &> /dev/null; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install git
fi

# install apps, tools and set a bunch of macos defaults
git clone https://github.com/edinhodzic/dotfiles.git ~/dotfiles
cd ~/dotfiles
./zsh.sh
./apps.sh
./tools.sh
./macos.sh
rm -rf ~/dotfiles

# tidy up
HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade
HOMEBREW_NO_AUTO_UPDATE=1 brew cleanup
HOMEBREW_NO_AUTO_UPDATE=1 brew doctor
