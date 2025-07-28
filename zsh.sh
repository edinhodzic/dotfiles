#!/bin/sh

echo '---------------------------------'
echo 'Zsh (1/2): Installing Zsh plugins'
echo '---------------------------------'

# Install Oh My Zsh (zsh is already default on modern macOS)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

echo '----------------------------------'
echo 'Zsh (2/2): Configuring Zsh plugins'
echo '----------------------------------'

if [ -f "$HOME/.zshrc" ]; then
  # Backup existing .zshrc
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
  
  # Update plugins line in .zshrc
  sed -i '' 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions sublime z)/' "$HOME/.zshrc"
  
  # Add APPEND_HISTORY option if not present
  if ! grep -q "APPEND_HISTORY" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# Append to history file" >> "$HOME/.zshrc"
    echo "setopt APPEND_HISTORY" >> "$HOME/.zshrc"
  fi

  # Apply Zsh updates
  source ~/.zshrc
  
else
  echo 'Warning: .zshrc not found. Oh My Zsh installation may have failed.'
fi
