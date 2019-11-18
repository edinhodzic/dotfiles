#!/bin/sh

. utils.sh

brew_cask_install java
brew_install scala
brew_install sbt
brew_cask_install intellij-idea
brew_cask_install docker

curl -s "https://get.sdkman.io" | bash
