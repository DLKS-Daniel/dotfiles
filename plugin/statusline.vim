" Function that lists named and unamed buffers
function! BufferList()
    let buffers = []
    for buf in range(1, bufnr('$'))
        if bufexists(buf) && buflisted(buf)
            let bufname = bufname(buf) ==# '' ? '[No Name]' : bufname(buf)
            let mod = getbufvar(buf, '&modified') ? '[+]' : ''
            call add(buffers, printf('%d:%s%s', buf, fnamemodify(bufname, ':t'), mod))
        endif
    endfor
    return join(buffers, ' | ')
endfunction

set laststatus=2
set statusline=
set statusline+=\[%{mode()}\]                 " current mode
set statusline+=%y                            " filetype
set statusline+=[buffers]\ %{BufferList()}

set statusline+=%=                            " right-align from now on

set statusline+=[col\ %v                      " column number
set statusline+=\                             " blank space
set statusline+=\&                            " colon separator
set statusline+=\                             " blank space
set statusline+=loc\ %l]                      " row number
set statusline+=\                             " blank space
set statusline+=[TLOC\:%L]                    " number of rows
set statusline+=\                             " blank space
