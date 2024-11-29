" Show fold column
function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction

" Detect empty buffer as JSON file
function! DetectJson()
	if &filetype == '' && getline(1) =~ '^{\|^\[' 
		set filetype=json 
	endif
endfunction

autocmd BufReadPost,BufNewFile,InsertLeave * call DetectJson()

function! DetectHTML()
	if &filetype == '' && getline(1) =~ '^<'
		set filetype=html
	endif
endfunction

autocmd BufReadPost,BufNewFile,InsertLeave * call DetectHTML()

" CursorLine only exists in one window at a time
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Load SPSS syntax
au BufNewFile,BufRead *.sps set filetype=spss

" Run code in buffer
function! CodeRunner()
    if &ft ==# 'python'
        execute 'RPy'
    elseif &ft ==# 'sh'
        execute 'RB'
	elseif &ft ==# 'javascript'
		execute 'RJs'
	elseif &ft ==# 'go'
		execute 'RGo'
    endif
endfunction

augroup code_runner
    au!
    au FileType python command! RPy :!python3 %
    au FileType sh command! RB :!bash %
		au FileType javascript command! RJs :!node %
    nnoremap <F12> :call CodeRunner()<CR>
augroup end
