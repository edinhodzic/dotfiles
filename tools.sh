#!/bin/sh

HOMEBREW_NO_AUTO_UPDATE=1 brew cask install \
java \
intellij-idea \
docker \
postman \
fork \
tunnelblick \
spectacle

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
scala \
sbt \
jq \
awscli \
httpie

curl -s "https://get.sdkman.io" | bash
