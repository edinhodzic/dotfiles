#!/bin/sh

echo '---------------------------------'
echo 'Zsh (1/3): Installing Zsh plugins'
echo '---------------------------------'

# Install Oh My Zsh (zsh is already default on modern macOS)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed, skipping..."
fi

# Install zsh plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
  echo "zsh-autosuggestions already installed, skipping..."
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
  echo "zsh-syntax-highlighting already installed, skipping..."
fi

echo '----------------------------------'
echo 'Zsh (2/3): Configuring Zsh plugins'
echo '----------------------------------'

if [ -f "$HOME/.zshrc" ]; then
  # Backup existing .zshrc
  echo "Backing up existing .zshrc to .zshrc.backup"
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup"

  # Update plugins line in .zshrc
  sed -i '' 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions sublime z)/' "$HOME/.zshrc"
  
  # Add APPEND_HISTORY option if not present
  if ! grep -q "APPEND_HISTORY" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# Append to history file" >> "$HOME/.zshrc"
    echo "setopt APPEND_HISTORY" >> "$HOME/.zshrc"
  fi
  
  echo '-------------------------------------'
  echo 'Zsh (3/3): Applying Zsh configuration'
  echo '-------------------------------------'

  zsh -c "source ~/.zshrc" 2>/dev/null || echo "Note: New zsh config will be active in new terminal sessions"

else
  echo 'Warning: .zshrc not found. Oh My Zsh installation may have failed.'
fi
