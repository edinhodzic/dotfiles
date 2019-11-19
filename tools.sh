#!/bin/sh

. utils.sh

brew_cask_install java
brew_install scala
brew_install sbt
brew_install jq
brew_install awscli
brew_install httpie
brew_cask_install intellij-idea
brew_cask_install docker
brew_cask_install postman
brew_cask_install fork
brew_cask_install tunnelblick
brew_cask_install spectacle

brew_install zsh
brew_install zsh-completions
brew_install zsh-syntax-highlighting
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# TODO symlink own ~/.zshrc
# TODO check plugins in ~/.zshrc
# TODO ensure ~/.zshrc contains "plugins=(git sublime ...)"
# TODO don't forget APPEND_HISTORY option

curl -s "https://get.sdkman.io" | bash
