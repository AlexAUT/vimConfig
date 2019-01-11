#!/bin/bash
cd "$(dirname "$0")"

echo "Updating vim plugins, this may take some while..."
vim +PluginUpdate +qall

echo "Compiling YouCompleteMe, required installed packages:"
echo "Clang with clang-format"
echo "Node with npm"

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --js-completer --system-libclang

echo "Finished!"
