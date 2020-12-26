" Set colorscheme to darcula if you want to use darcula theme

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'ale', 'modified' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'ale': 'LinterStatus'
      \ },
    \ }
