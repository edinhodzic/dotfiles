#!/bin/sh

echo '------------------------------------------------------'
echo 'Install (1/3): Installing prerequisites (brew and git)'
echo '------------------------------------------------------'

# brew and git are prerequisites
if ! type brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  brew update
fi

if ! type git &> /dev/null; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install git
fi

echo '--------------------------------------------------------------------'
echo 'Install (2/3): Cloning dotfiles repository and running installations'
echo '--------------------------------------------------------------------'

# install apps, tools and set a bunch of macos defaults
git clone https://github.com/edinhodzic/dotfiles.git ~/dotfiles
cd ~/dotfiles
./zsh.sh
./apps.sh
./tools.sh
./macos.sh

# Optional: run ./personal.sh to install personal apps (WhatsApp, NordVPN, Philips Hue Sync, Sonos)

echo '---------------------------------------'
echo 'Install (3/3): Tidying up and finishing'
echo '---------------------------------------'

rm -rf ~/dotfiles
HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade
HOMEBREW_NO_AUTO_UPDATE=1 brew cleanup
HOMEBREW_NO_AUTO_UPDATE=1 brew doctor
