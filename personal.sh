#!/bin/sh

echo ""
echo '----------------------------------------'
echo 'Personal (1/3): Installing personal apps'
echo '----------------------------------------'

HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask \
whatsapp \
spotify \
nordvpn \
philips-hue-sync \
sonos

echo '---------------------------------------'
echo 'Personal (2/3): Setting up SSH for Git'
echo '---------------------------------------'

# Check if SSH key already exists
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "SSH key not found. Let's create one..."
    echo ""
    
    # Prompt for email
    echo "Enter your email address for the SSH key:"
    read -r email
    
    # Generate SSH key
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""
    
    # Start SSH agent and add key
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    
    # Copy public key to clipboard
    pbcopy < ~/.ssh/id_ed25519.pub
    
    echo ""
    echo "============================================"
    echo "SSH public key has been copied to clipboard!"
    echo "============================================"
    echo ""
    echo "Please complete these steps:"
    echo "1. Go to https://github.com/settings/ssh/new"
    echo "2. Sign in to your GitHub account"
    echo "3. Give the key a title (e.g., 'MacBook Pro')"
    echo "4. Paste the key (Cmd+V) into the 'Key' field"
    echo "5. Click 'Add SSH key'"
    echo ""
    echo "Press any key when you've added the SSH key to GitHub..."
    read -n 1 -s
    echo ""
    echo "Great! Testing SSH connection..."
    
    # Test SSH connection
    ssh -T git@github.com 2>&1 | head -1
    echo ""
else
    echo "SSH key already exists, skipping setup..."
    echo ""
fi

echo '-------------------------------------'
echo 'Personal (3/3): Cloning some projects'
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
