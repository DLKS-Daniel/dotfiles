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
