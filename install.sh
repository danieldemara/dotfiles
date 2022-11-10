#!/bin/sh

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# zsh
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# karabiner
rm -rf $HOME/.config/karabiner
ln -s $HOME/.dotfiles/karabiner $HOME/.config/karabiner

# alacritty
rm -rf $HOME/.config/alacritty
ln -s $HOME/.dotfiles/alacritty $HOME/.config/alacritty

# nvim
rm -rf $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

# tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# ideavim
rm -rf $HOME/.ideavimrc
ln -s $HOME/.dotfiles/.ideavimrc $HOME/.ideavimrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Install global npm packages
npm install -g eslint_d @fsouza/prettierd

# Install PHP Extensions
pecl install xdebug
pecl install redis

# Install global composer packages
/usr/local/bin/composer global require "squizlabs/php_codesniffer=*"

# Install global python packages
pip3 install black flake8 pylint

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install global go packages
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest

# Configure Java LSP Addons
if [ ! -d "$HOME/.config/nvim/java-debug" ]
then
    git clone git@github.com:microsoft/java-debug.git ~/.config/nvim/java-debug
fi
pushd ~/.config/nvim/java-debug
./mvnw clean install
popd

if [ ! -d "$HOME/.config/nvim/vscode-java-test" ]
then
    git clone git@github.com:microsoft/vscode-java-test.git ~/.config/nvim/vscode-java-test
fi
pushd ~/.config/nvim/vscode-java-test
npm install
npm run build-plugin
popd

# Enable font smoothing for macos for alacritty
defaults write org.alacritty AppleFontSmoothing -int 0

# Autoconfigure nvim packages
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
