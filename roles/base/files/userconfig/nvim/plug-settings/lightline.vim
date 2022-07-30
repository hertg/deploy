let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
	\   'cocstatus': 'coc#status',
  \   'gitbranch': 'FugitiveHead'
  \ },
  \}
