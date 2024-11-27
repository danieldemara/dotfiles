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

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file Brewfile

# Install dotfile packages
stow alacritty
stow zshrc
stow oh-my-zsh
stow tmux
stow karabiner
stow nvim
stow readline
stow ideavim
stow k9s

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
