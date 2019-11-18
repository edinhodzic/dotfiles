#!/bin/sh

if [[ $(brew --version) ]] ; then
  echo "Brew installed so attempting update"
  brew update
else
  echo "Brew not installed so attempting install"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
