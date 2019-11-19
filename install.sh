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

# with prerequisites in place, get the dotfiles
git clone https://github.com/edinhodzic/dotfiles.git ~/dotfiles
cd ~/dotfiles

# set a bunch of macos defaults and install apps and tools
./macos.sh
./apps.sh
./tools.sh
./zsh.sh

# let the human check the output of this
HOMEBREW_NO_AUTO_UPDATE=1 brew doctor
