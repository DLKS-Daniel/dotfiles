" General
let mapleader="\<Space>"
let maplocalleader=","
set hidden
set updatetime=100
set signcolumn=yes
set mouse=a
set nocompatible
set cursorline
set termguicolors
set t_Co=256
set t_ut=
colorscheme codedark

" Directory specification and undo history
set viminfo='50,f1,<500,n~/.vim/viminfo
function! EnsureVimhisExists()
    let vimhis_path = expand('~/.vim/history')

    if !isdirectory(vimhis_path)
        call mkdir(vimhis_path, 'p')
        echo "Created directory: " . vimhis_path
    endif
endfunction
call EnsureVimhisExists()

if has('persistent_undo')
	set undodir=$HOME/.vim/history
	set undolevels=5000
	set undofile
endif

" netrw
" Change directory to the current buffer when opening files.
set autochdir
let g:netrw_banner=0
let g:netrw_keepdir=0
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
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*\\tmp\\*,*.swp,*.zip
set showcmd
set showmatch

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
" Colorschemes
Plug 'tomasiser/vim-code-dark'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/spss-syntax-highlighting-file'
Plug 'sheerun/vim-polyglot'

" motions
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" others
Plug 'Donaldttt/fuzzyy'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'shime/vim-livedown'
Plug 'gcmt/taboo.vim'

" journaling
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

call plug#end()

" Manpages
runtime! ftplugin/man.vim
