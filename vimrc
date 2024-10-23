" General
let maplocalleader=","
let mapleader=" "
set hidden
set updatetime=100
set signcolumn=yes
set mouse=a
set nocompatible
set cursorline
colorscheme desert

" Directory specification
set viminfo='50,f1,<500,n~/.vim/viminfo
set undodir=n~/.vim/undo

" netrw
" Change directory to the current buffer when opening files.
set autochdir
let g:netrw_banner=0
let g:netrw_liststyle=3

" Split	preferences
set splitright
set splitbelow

" Line numbers and scrolloff
set number
set relativenumber
set scrolloff=20
set sidescroll=10

" Filetype settings
" Detects external changes to a file
syntax on
filetype plugin indent on
set fileencoding=UTF-8
set fileencodings=UTF-8
set autoread
set foldmethod=syntax
set foldlevel=99
au FocusGained,BufEnter * silent! checktime

" Error and undo handling
set noerrorbells visualbell t_vb=
set noswapfile
set nobackup
set nowritebackup
set undofile
set clipboard=unnamed

" Search completion in the vim terminal
" Buffer navigation
set wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <leader>bf :buffer <C-Z>
nnoremap <leader>bd :BD<cr>
nnoremap <leader>ls :buffers<cr>

" Completion opt
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set showcmd
set showmatch
set pumheight=7

" Search with / 
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab, shift and indentation settings
set autoindent
set smarttab
set linebreak
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=119

" Plugin management
call plug#begin()

Plug 'rose-pine/vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()
