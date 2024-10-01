" Motion rebinds
nnoremap <CR> :nohlsearch<CR><CR>:<backspace>

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
nnoremap <leader>e $
vnoremap <leader>e $
nnoremap <leader>q ^
vnoremap <leader>q ^

" Command line
nnoremap <leader>cc :
vnoremap <leader>cc :

" To prevent windows terminal and its slow ass paste
nnoremap <C-V> p
inoremap <C-V> <Esc>p

" Format and detect JSON
nnoremap <leader>js ma:%!jq '.'<cr>'a

" Copy all items - sets mark, goes to top, V to bot, yank then back to mark
nnoremap <leader>ca mbggVGy'b

" Replace all instances of selection
nnoremap <leader>sr :%s/\c\<<C-R><C-W>\>//g<Left><Left>

" Show fold column
nnoremap <leader>fc :call FoldColumnToggle()<cr>

" Open and close windows + tabs
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>te :tabnew<CR>:Ex<CR>
nnoremap <leader>ww :vnew<cr>
nnoremap <leader>wh :new<cr>
nnoremap <leader>we :vnew<cr>:Ex<cr>
nnoremap <leader>wq :wincmd q<cr>

" Split navigation
nnoremap <silent> <C-H> :wincmd h<cr>
nnoremap <silent> <C-J> :wincmd j<cr>
nnoremap <silent> <C-K> :wincmd k<cr>
nnoremap <silent> <C-L> :wincmd l<cr>

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
nnoremap <localleader>cn :tabnew<cr>:edit $MYVIMRC<cr> 
nnoremap <localleader>cc :tabnew<cr>:CocConfig<cr>
nnoremap <localleader>cm :CocList marketplace<cr>

" Emacs navigation for commandline
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
