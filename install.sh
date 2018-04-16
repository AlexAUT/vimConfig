#!/bin/bash
cd "$(dirname "$0")"

rm -f ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc
