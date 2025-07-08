#!/bin/sh

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
# sdk install scala
# sdk install sbt
# sdk install dotty
sdk install kotlin
sdk install gradle

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
intellij-idea \
cursor \
docker \
postman \
datagrip \
fork \
# tunnelblick \
spectacle \
cookiecutter

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
jq \
awscli \
httpie \
# newman \
docker-compose \
gpg-suite \
adr-tools \
graphviz \
tfsec \
trivy \
terragrunt \
yarn

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

brew tap cloudflare/cloudflare
brew install cloudflare/cloudflare/cf-terraforming

# TODO prowler, Cursor Pro mouse thing
