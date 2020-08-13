"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,php,python,ruby"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'gabesoft/vim-ags'
Plug 'alexaut/vim-clang-format'
Plug 'derekwyatt/vim-fswitch'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'puremourning/vimspector'
Plug 'alexaut/vim-cmake'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'morhetz/gruvbox'

"let g:polyglot_disabled = ['c++11']
"Plug 'sheerun/vim-polyglot'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark="medium"


" Search including hidden files
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Gui settings
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions=Ace
set guioptions-=e
" GVim
let g:indentLine_setColors = 0

set guifont=JetBrains\ Mono\ 10
set linespace=2

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set smarttab
set expandtab
"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set number relativenumber
set nu rnu

set undofile
set undodir=$HOME/.cache/vim/undo
set undolevels=100
set undoreload=100

" Blinking cursor
set gcr=a:blinkon0

" Detect style
set modeline
set modelines=20

" Clipboard
set clipboard=unnamed,unnamedplus

autocmd FileType c,cpp,cuda ClangFormatAutoEnable
au BufRead,BufNewFile *.mesh set filetype=glsl
au BufRead,BufNewFile *.task set filetype=glsl

" Center on search result
nnoremap n nzzzv
nnoremap N Nzzzv

cnoreabbrev W! w!
cnoreabbrev Q! Q!
cnoreabbrev Qall! Qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Do not load default session
let g:session_autosave = "yes"
let g:session_autoload = "no"

"Setup fswitch to search in inc for header
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.h let b:fswitchdst = 'cpp,cu' | let b:fswitchlocs = 'reg:/include/src'
au! BufEnter *.cu let b:fswitchdst = 'cuh,hpp,h' | let b:fswitchlocs = 'reg:/src/include'
au! BufEnter *.cuh let b:fswitchdst = 'cu,cpp' | let b:fswitchlocs = 'reg:/include/src'

" au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = 'reg:/src/inc'
" au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:/inc/src'
" au! BufEnter *.h let b:fswitchdst = 'cpp,cu' | let b:fswitchlocs = 'reg:/inc/src'
" au! BufEnter *.cu let b:fswitchdst = 'cuh,hpp,h' | let b:fswitchlocs = 'reg:/src/inc'
" au! BufEnter *.cuh let b:fswitchdst = 'cu,cpp' | let b:fswitchlocs = 'reg:/inc/src'

" SHORTCUTS
map <F9> :NERDTreeFind<CR>
map <C-P> :Files<CR>
map <C-0> :HFiles<CR>
map <C-G> :GFiles<CR>
nnoremap <Leader>s :Ag<Space><C-R>=expand('<cword>')<CR><CR>
vnoremap <Leader>sy :Ag<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader><Leader>a :AgsQuit<CR>

nmap <F1> <Plug>(coc-declaration)
nmap <F2> <Plug>(coc-references)
nmap <C-]> <Plug>(coc-definition)
" nnoremap <F4> :FSHere<CR>
nnoremap <F4> :CocCommand clangd.switchSourceHeader<CR>
nmap <F5> <Plug>(coc-fix-current)
nmap <F8> <Plug>(coc-diagnostic-next)
nmap <S-F8> <Plug>(coc-diagnostic-prev)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>y :History:<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

nnoremap <silent> <leader><space> :noh<CR>

" COC.NVIM CONFIG
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight token when resting cursor on it
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use // instead of /* */
autocmd FileType c,cpp,cs,java,cuda,glsl setlocal commentstring=//\ %s

" Vimspector
"let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]

nmap <S-F1> :CMakeBuild --parallel<CR>
nmap <S-F5> <Plug>VimspectorContinue
" <Plug>VimspectorContinue
nmap <S-F3> <Plug>VimspectorStop
nmap <S-F2> <Plug>VimspectorPause
nmap <S-F4> <Plug>VimspectorRestart
nmap <S-F9> <Plug>VimspectorToggleBreakpoint
nmap <S-F10> <Plug>VimspectorStepOver
nmap <S-F11> <Plug>VimspectorStepInto
nmap <S-F12> <Plug>VimspectorStepOut

let g:cmake_close_on_success=1
autocmd User CMakeBuildSucceeded call vimspector#Restart()
