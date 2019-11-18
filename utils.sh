#!/bin/sh

brew_install () {
  if ! type $1 &> /dev/null; then
  	echo "installing $1"
    brew install $1
  else
    echo "$1 already installed"
  fi
}

brew_cask_install () {
  if ! type $1 &> /dev/null; then
  	echo "installing $1"
    brew cask install $1
  else
    echo "$1 already installed"
  fi
}
