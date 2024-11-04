" Motion rebinds
nnoremap <CR> :nohlsearch<CR><CR>:<backspace>
nnoremap U <C-R>
nnoremap <C-Z> <Esc>
vnoremap <C-Z> <Esc>
nnoremap <C-E> :
vnoremap <C-E> :

" Directories and registers
nnoremap <leader>ls :buffers<cr>
nnoremap <leader>cd :cd<Space>
nnoremap <leader>r :registers<cr>

" Change wincmd Split
nnoremap <C-W>v :vnew<cr>
nnoremap <C-W>s :new<cr>
nnoremap <C-W>e :enew<cr>
nnoremap <C-W><C-V> :vnew<cr>
nnoremap <C-W><C-S> :new<cr>
nnoremap <C-W><C-E> :enew<cr>

" Move in insert
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-K> <Up>
inoremap <C-J> <Down>

" j + j to exit cmd and insert
inoremap jj <esc>
cnoremap jj <esc>

" Move lines up and down
nnoremap - ddp
nnoremap _ ddkP

" navigate wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" end and start line
nnoremap <leader>q ^
vnoremap <leader>q ^

" To prevent windows terminal and its slow ass paste
nnoremap <C-V> p
inoremap <C-V> <Esc>p

" Format and detect JSON
nnoremap <leader>js ma:%!jq '.'<cr>'a

" Copy all items - sets mark, goes to top, V to bot, yank then back to mark
nnoremap <leader>ca mbggVGy'b

" Replace all instances of selection
nnoremap <leader>sr :%s/\c\<<C-R><C-W>\>//g<Left><Left>
" Clear whitespace
nnoremap <leader>dw :%s/\s\+$//<cr>

" Show fold column
nnoremap <leader>fc :call FoldColumnToggle()<cr>

" Tab navigation
nnoremap <silent> <C-Tab> :tabnext<CR>
nnoremap <silent> <C-S-Tab> :tabpre<CR>

" local leader things
nnoremap <localleader>e :Explore<cr>
nnoremap <localleader>d :echo getcwd()<cr>
nnoremap <localleader>w :w ./
nnoremap <localleader>v :set wrap!<cr>
nnoremap <localleader>l :set cursorline!<cr>
nnoremap <localleader>t :term<cr>
nnoremap <localleader>h :help<cr>:wincmd T<cr>

" vimrc and coc.nvim config shortcuts
nnoremap <localleader>. :source $MYVIMRC<cr>
nnoremap <localleader>cn :edit $MYVIMRC<cr>
nnoremap <localleader>cc :CocConfig<cr>
nnoremap <localleader>cm :CocList marketplace<cr>

" Emacs navigation for commandline
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
