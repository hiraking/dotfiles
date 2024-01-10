#!/bin/bash
if [ -d ~/.config/fish ]; then 
    echo "overriding exisiting ~/.config/fish directory"
    rm -r ~/.config/fish
fi
echo "~/.config/fish -> ~/dotfiles/.config/fish"
ln -s ~/dotfiles/.config/fish ~/.config/fish

if [ -f ~/.vimrc ]; then
    echo ".vimrc already exists, skipping the ln command."
else
    echo "~/.vimrc -> ~/dotfiles/min_rc.vim"
    ln -s ~/dotfiles/min_rc.vim ~/.vimrc
fi
