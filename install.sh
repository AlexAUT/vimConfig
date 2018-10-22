#!/bin/bash
cd "$(dirname "$0")"

rm -f ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc

# Make undo folder, or otherwise vim cannot store the history
mkdir -p ~/.vim/undo

echo "Insalling vundle..."
mkdir -o ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "Installing vim plugins, this may take some while..."
vim +PluginInstall +qall

echo "Compiling YouCompleteMe, required installed packages:"
echo "Clang with clang-format"
echo "Node with npm"

sudo npm install -g typescript
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --js-completer --system-libclang

cd ~/.vim/bundle/fzf
./install --all

echo "Finished!"
