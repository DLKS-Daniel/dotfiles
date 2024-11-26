
let g:lightline = {
			\ 'active': {
			\ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], ['syntaxitem'], ['bufnum' ] ],
			\ 'left': [ [ 'mode' ], [ 'readonly' ], [ 'absolutepath' ], [ 'modified' ], [ 'gitbranch' ] ],
			\ },
			\ 'component_function': {
			\ 'gitbranch': 'FugitiveHead',
			\ },
			\ 'component': {
			\ 'charvaluehex': '0x%B',
			\ 'lineinfo': '%l\%L',
			\ },
			\ 'component_expand': {
			\   'buffers': 'lightline#bufferline#buffers'
			\ },
			\ 'component_type': {
			\   'buffers': 'tabsel'
			\ }
			\ }
