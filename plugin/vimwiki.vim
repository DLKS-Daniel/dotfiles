let g:vimwiki_list = [{'syntax': 'markdown'}]
let g:vimwiki_use_calendar=1

autocmd BufNewFile *diary/*.wiki 0r! ~/.vim/vimwiki-diary-tpl.py '%'
