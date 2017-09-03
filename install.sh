#!/bin/bash

sudo apt install exuberant-ctags ack-grep vim-gtk
if [ -f "$HOME/.vimrc" ]; then
	if [ ! -e "./old_vimrc" ]; then
		mkdir old_vimrc
	fi
	mv $HOME/.vimrc old_vimrc
fi
cp ./_vimrc $HOME/
mv $HOME/_vimrc $HOME/.vimrc
