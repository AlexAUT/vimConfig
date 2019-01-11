# Simple but feature rich vim config
![Example Screenshot](https://i.imgur.com/7ziZEJC.png)

## Prerequisite
* vim (8.1+ is tested, but should work below)
* fzf
* clang
* npm

## Install
Execute `install.sh` ignore the vim error and press enter. Now vundle installs the plugins, this may take up to 10minutes if you have a slow internet connection.

## Important
By default the arrow keys are **disabled**, if you want them remove the last block in the vimrc file :)

## Custom shortcuts

### File navigation
**Ctrl+P** Filesearch from the root directory, provided by fzf

**F9** Jumps in nerdtree to the file of the current buffer

### Sourcecode jumps (provided by YCM)
**F2** shows type of symbol in the status line

**F3** goto symbol under cursor

**F4** switches between header/source file. (hpp,h,cuh <-> cpp,c,cu, more can be easily added in the config)

**F5** Fixit

## Enable autocompletion for C/C++ projects

### If your project uses CMake
Just enable CMAKE_EXPORT_COMPILE_COMMANDS and add a link to the generated compile_commands.json to the folder you start vim from. 

You can also use the python script under __.vim/bundle/YCM-Generator__ to generate a build settings file. The script will create it besides the root CMakeLists.txt, do not forget to copy it to the folder where you start vim from.

### Otherwise
Start to use CMake or some other build system which generates compile-commands.json

## Vim Plugin list
  * YouCompleteMe
  * vim-clang-format
  * typescript-vim
  * nerdtree
  * vim-gitgutter
  * vim-airline
  * vim-fugitive
  * CompleParameter.vim (by default disabled)
  * vim-cmake-syntax
  * YCM-Generator
  * indentline
  * vim-cpp-enchanced-highlight
  * vim-glsl
  * vim-fswitch
  * oceanic-next (theme)
  * fzf.vim
  * vim-elixir

