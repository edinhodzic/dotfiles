#!/bin/sh

HOMEBREW_NO_AUTO_UPDATE=1 brew install zsh 
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# install fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# TODO symlink own ~/.zshrc
# TODO check plugins in ~/.zshrc
# TODO ensure ~/.zshrc contains "plugins=(git sublime ...)"
# TODO don't forget APPEND_HISTORY option
