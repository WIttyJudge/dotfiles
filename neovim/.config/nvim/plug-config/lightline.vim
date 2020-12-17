let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'ale', 'modified' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'ale': 'LinterStatus'
      \ },
    \ }
