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
    else
        echo "aborted."
    fi
else
    ln -s $base/zsh/.zshrc ~/.zshrc
fi


# VIM
if [ -e ~/.vimrc ]; then
    if prompt "vimrc already exists. Overwrite?"; then
        echo "overwrite configurations"
    else
        echo "aborted."
    fi
else
    ln -s $base/vim/.vimrc ~/.vimrc
fi
