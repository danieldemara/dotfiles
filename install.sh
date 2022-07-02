# zsh
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# alacritty
rm -rf $HOME/.config/alacritty
ln -s $HOME/.dotfiles/alacritty $HOME/.config/alacritty

# nvim
rm -rf $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

# tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

