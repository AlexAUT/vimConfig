set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'rdnetto/YCM-Generator'
Plugin 'yggdroot/indentline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tikhomirov/vim-glsl'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'mhartington/oceanic-next'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'elixir-editors/vim-elixir'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set encoding=utf-8
set termguicolors
let g:gruvbox_italic=1
set background=dark
colorscheme OceanicNext

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Close NERDTree if last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType c,cpp ClangFormatAutoEnable

" Look for .clang_format file and provide a default configuration
let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "Language": "Cpp",
            \ "DerivePointerAlignment": "false",
            \ "AllowShortFunctionsOnASingleLine": "Inline",
            \ "PointerAlignment": "Left",
            \ "ColumnLimit": "120",
            \ "BreakBeforeBraces": "Allman",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "IndentWidth": "2",
            \ "UseTab": "Never",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine": "true",
            \ "BreakConstructorInitializers": "AfterColon",
            \ }

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set cino=>N-s,g0

" YouCompleteMe key bindings
:nmap <F5> :YcmCompleter FixIt <CR>

:nmap <F2> :YcmCompleter GetType <CR>
:nmap <F3> :YcmCompleter GoTo <CR>
:nmap <F4> :FSHere <CR>
:nmap <F5> :YcmCompleter FixIt <CR>

" NERDTree
:nmap <F9> :NERDTreeFind <CR>

" FZF
:nmap <C-P> :Files <CR>
:imap <c-x><c-l> <plug>(fzf-complete-line)

" Increase git gutter update interval
set updatetime=200

" Minimal setup for parameter completion
" inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
set cmdheight=2
" Fix for the delay when switching insert to normal mode
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" CSS autocompletion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufRead,BufNewFile *.cuh set filetype=cuda

" Autoindent
let g:indentLine_enabled = 1

" Folding
set foldmethod=indent
set foldlevelstart=100

set clipboard=unnamed

"Setup fswitch to search in inc for header
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.cu let b:fswitchdst = 'cuh,hpp,h' | let b:fswitchlocs = 'reg:/include/src,../'
au! BufEnter *.cuh let b:fswitchdst = 'cu,cpp' | let b:fswitchlocs = 'reg:/include/src'

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap! <Up> <NOP>
noremap! <Down> <NOP>
noremap! <Left> <NOP>
noremap! <Right> <NOP>
