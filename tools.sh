#!/bin/sh

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install scala
sdk install sbt
sdk install dotty

HOMEBREW_NO_AUTO_UPDATE=1 brew cask install \
intellij-idea \
visual-studio-code \
docker \
postman \
fork \
tunnelblick \
spectacle

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
jq \
awscli \
httpie \
newman \
gpg-suite

# https://pip.pypa.io/en/stable/installing/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-macos
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install --user ansible
