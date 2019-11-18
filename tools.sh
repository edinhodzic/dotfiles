#!/bin/sh

. utils.sh

brew_cask_install java
brew_install scala
brew_install sbt
brew_install jq
brew_cask_install intellij-idea
brew_cask_install docker
brew_cask_install postman

curl -s "https://get.sdkman.io" | bash
