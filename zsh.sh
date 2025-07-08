#!/bin/sh

HOMEBREW_NO_AUTO_UPDATE=1 brew install zsh 
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# TODO symlink own ~/.zshrc
# TODO check plugins in ~/.zshrc
# TODO ensure ~/.zshrc contains...
# plugins=(
#   git
#   zsh-syntax-highlighting
#   zsh-autosuggestions
#   sublime
#   z
# )
# TODO don't forget APPEND_HISTORY option
