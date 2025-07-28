#!/bin/sh

echo ""
echo '----------------------------------------'
echo 'Personal (1/2): Installing personal apps'
echo '----------------------------------------'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
whatsapp \
spotify \
nordvpn \
philips-hue-sync \
sonos

echo '-------------------------------------'
echo 'Personal (2/2): Cloning some projects'
echo '-------------------------------------'

# Create development directory if it doesn't exist
mkdir -p ~/dev/edinhodzic && cd ~/dev/edinhodzic

# Clone private repositories
echo 'Cloning reference projects...'
git clone git@github.com:edinhodzic/reference-http4k-api.git
git clone git@github.com:edinhodzic/reference-http4k-api-pact-test.git
git clone git@github.com:edinhodzic/reference-http4k-api-perf-test.git
git clone git@github.com:edinhodzic/reference-react-frontend.git

echo 'Cloning cookiecutter templates...'
git clone git@github.com:edinhodzic/cookiecutter-http4k-api.git
git clone git@github.com:edinhodzic/cookiecutter-http4k-api-pact-test.git
git clone git@github.com:edinhodzic/cookiecutter-http4k-api-perf-test.git
git clone git@github.com:edinhodzic/cookiecutter-react-frontend.git

echo ''
echo 'NOTE: If git clone failed, ensure your SSH keys are set up:'
echo '  ssh-keygen -t ed25519 -C "your_email@example.com"'
echo '  cat ~/.ssh/id_ed25519.pub  # Add this to GitHub Settings > SSH Keys'
