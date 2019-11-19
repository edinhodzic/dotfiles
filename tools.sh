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
httpie \
zsh \
zsh-completions \
zsh-syntax-highlighting \

chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# TODO symlink own ~/.zshrc
# TODO check plugins in ~/.zshrc
# TODO ensure ~/.zshrc contains "plugins=(git sublime ...)"
# TODO don't forget APPEND_HISTORY option

curl -s "https://get.sdkman.io" | bash
