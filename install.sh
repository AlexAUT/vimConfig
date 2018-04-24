#!/bin/bash
cd "$(dirname "$0")"

rm -f ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc

# Make undo folder, or otherwise vim cannot store the history
mkdir -p ~/.vim/undo
