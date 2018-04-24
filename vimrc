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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'leafgarland/typescript-vim'
Plugin 'Heorhiy/VisualStudioDark.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'rdnetto/YCM-Generator'
Plugin 'majutsushi/tagbar'
Plugin 'yggdroot/indentline'
Plugin 'octol/vim-cpp-enhanced-highlight'

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
set termguicolors
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" let g:ycm_autoclose_preview_window_after_insertion = 1

autocmd FileType c,cpp ClangFormatAutoEnable

let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "Language": "Cpp",
            \ "DerivePointerAlignment": "false",
            \ "PointerAlignment": "Left",
            \ "ColumnLimit": "120",
            \ "BreakBeforeBraces": "Allman",
            \ "AllowShortFunctionsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "IndentWidth": "2",
            \ "UseTab": "Never",
            \ }

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set cino=>N-s,g0

" YouCompleteMe key bindings
:nmap <F5> :YcmCompleter GetType <CR>

:nmap <F2> :YcmCompleter GoToDefinition <CR>
:nmap <F3> :YcmCompleter GoToType <CR>
:nmap <F4> :YcmCompleter GoToReferences <CR>

" Ignore git files in file search
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Increase git gutter update interval
set updatetime=100

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

" Autoindent
let g:indentLine_enabled = 1

" Folding
set foldmethod=indent
set foldlevelstart=20

