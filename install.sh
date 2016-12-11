#!/bin/bash

if [ -f "$HOME/.vimrc" ]; then
	if [ ! -e "./old_vimrc" ]; then
		mkdir old_vimrc
	fi
	mv $HOME/.vimrc old_vimrc
fi
cp ./_vimrc $HOME/
mv $HOME/_vimrc $HOME/.vimrc
