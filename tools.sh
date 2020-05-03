#!/bin/sh

curl -s "https://get.sdkman.io" | bash
sdk install java scala sbt

HOMEBREW_NO_AUTO_UPDATE=1 brew cask install \
intellij-idea \
docker \
postman \
fork \
tunnelblick \
spectacle

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
jq \
awscli \
httpie \
gpg-suite
