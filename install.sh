#!/bin/zsh

base=`pwd`

function prompt {
    read "?$1 (y/n): "
    while [[ ! $REPLY =~ ^[YyNn]$ ]]; do
        read "?Please enter y or n: ";
    done
    [[ $REPLY =~ ^[Yy]$ ]]
}

# ZSH
if [ -e ~/.zshrc ]; then
    if prompt "zshrc already exists. Overwrite?"; then
        echo "overwrite configurations"
        ln -fs $base/zsh/.zshrc ~/.zshrc
    else
        echo "aborted..."
    fi
else
    ln -s $base/zsh/.zshrc ~/.zshrc
fi

# VIM
if [ -e ~/.vimrc ]; then
    if prompt "vimrc already exists. Overwrite?"; then
        echo "overwrite configurations"
        ln -fs $base/vim/.vimrc ~/.vimrc
    else
        echo "aborted..."
    fi
else
    ln -fs $base/vim/.vimrc ~/.vimrc
fi
# vim undo persistance
if [ ! -d ~/.vim/undo ]; then
    echo create vim undo file
    mkdir ~/.vim/undo
fi


# TMUX
if [ -e ~/.tmux.conf ]; then
    if prompt "tmux.conf already exists. Overwrite?"; then
        echo "overwrite configurations"
        ln -fs $base/tmux/.tmux.conf ~/.tmux.conf
    else
        echo "aborted..."
    fi
else
    ln -fs $base/tmux/.tmux.conf ~/.tmux.conf
fi

# install apt-packages 
./apt-packages/install.sh

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# linux brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# direnv
brew install direnv
