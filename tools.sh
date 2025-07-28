#!/bin/sh

echo ""
echo '-----------------------------------------'
echo 'Tools (1/3): Installing development tools'
echo '-----------------------------------------'

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Dev Tools - Language Runtimes & Build Tools
sdk install java
sdk install kotlin
sdk install gradle
# sdk install scala
# sdk install sbt
# sdk install dotty

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
intellij-idea \
cursor \
docker \
postman \
fork
# datagrip

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
jq \
httpie \
docker-compose \
adr-tools \
yarn \
cookiecutter
# newman \

echo '------------------------------------------------'
echo 'Tools (2/3): Installing ops/infrastructure tools'
echo '------------------------------------------------'

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
awscli \
tfsec \
trivy \
terragrunt

echo '-----------------------------------------'
echo 'Tools (3/3): Installing general utilities'
echo '-----------------------------------------'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
spectacle

HOMEBREW_NO_AUTO_UPDATE=1 brew install \
gpg-suite \
graphviz

# TODO prowler, Cursor Pro mouse thing
# TODO cloudflare tools:
# brew tap cloudflare/cloudflare
# brew install cloudflare/cloudflare/cf-terraforming
