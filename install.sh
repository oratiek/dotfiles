#!/bin/bash

# install curl
sudo apt install -y curl
sudo apt install -y tmux
sudo apt install -y zsh
sudo apt install -y vim-gtk
sudo apt install -y ibus-mozc mozc-utils-gui
sudo apt install -y gnome-tweaks
sudo apt install -y git

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# config files
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/dotfiles/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
