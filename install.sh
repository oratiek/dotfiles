#!/bin/bash

# install curl
sudo apt install -y curl
sudo apt install -y tmux
sudo apt install -y zsh
sudo apt install -y ibus-mozc mozc-utils-gui
sudo apt install -y gnome-tweaks
sudo apt install -y git

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# config files
ln -s vim/.vimrc ~/.vimrc
ln -s zsh/.zshrc ~/.zshrc
ln -s tmux/.tmux.conf ~/.tmux.conf
