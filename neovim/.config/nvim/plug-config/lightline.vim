let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'ale' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'ale': 'LinterStatus'
      \ },
    \ }
