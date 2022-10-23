#!/bin/bash
#DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )
DIR="$(dirname "$(readlink -f "$0")")"
# cp $0 $DIR/
cp ~/.vimrc $DIR/
cp ~/.tmux.conf $DIR/
cp ~/.tmuxline $DIR/
cp ~/.bashrc $DIR/
cp ~/.zshrc $DIR/
cp -r ~/.tmux $DIR/
cp -r ~/.config/nvim $DIR/.config/
cp -r ~/.config/ranger $DIR/.config/
cp -r ~/.config/fish $DIR/.config/
cp -r ~/.config/kitty $DIR/.config
