let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Delete buffers
let s:default_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
function! s:action_for(key, ...)
    let default = a:0 ? a:1 : ''
    let Cmd = get(get(g:, 'fzf_action', s:default_action), a:key, default)
    return type(Cmd) == s:TYPE.string ? Cmd : default
endfunction

function! s:find_open_window(b)
    let [tcur, tcnt] = [tabpagenr() - 1, tabpagenr('$')]
    for toff in range(0, tabpagenr('$') - 1)
        let t = (tcur + toff) % tcnt + 1
        let buffers = tabpagebuflist(t)
        for w in range(1, len(buffers))
            let b = buffers[w - 1]
            if b == a:b
                return [t, w]
            endif
        endfor
    endfor
    return [0, 0]
endfunction

function! s:jump(t, w)
    execute a:t.'tabnext'
    execute a:w.'wincmd w'
endfunction

function! s:buffers_sink(lines, query, fullscreen)
    if len(a:lines) < 3
        return
    endif
    let b = matchstr(a:lines[2], '\[\zs[0-9]*\ze\]')
    let bufname=split(a:lines[2])[-1]
    let action = a:lines[1]
    if empty(action)
        let [t, w] = s:find_open_window(b)
        if t
            call s:jump(t, w)
            return
        endif
        execute 'buffer' b
        return
    endif
    if action==?'ctrl-d'
        execute 'bdelete' b
        call s:custom_buffer(a:query, a:fullscreen)
    else
        let cmd = s:action_for(action)
        if !empty(cmd)
            execute 'silent' cmd
        endif
        execute 'buffer' b
    endif
endfunction

function! s:custom_buffer(query, fullscreen)
    let spec = { 'sink*': {lines -> s:buffers_sink(lines, a:query, a:fullscreen)},
                \ 'options': [
                \   '--print-query',
                \   '--prompt', 'Buffer> '
                \ ],
                \ 'placeholder': '{1}'
                \ }
    let spec._action = get(g:, 'fzf_action', s:default_action)
    call add(spec.options, '--expect=ctrl-d,'.join(keys(spec._action), ','))
    call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -bar -bang -nargs=? -complete=dir FzfxBuffers call s:custom_buffer(<q-args>, <bang>0)

" Keybindings
noremap <silent> <leader>fl :Lines<CR>
noremap <silent> <leader>fb :Buffers<CR>
noremap <silent> <leader>ff :Files<CR>
noremap <silent> <leader>fs :Files
noremap <silent> <leader>fg :Rg<CR>
