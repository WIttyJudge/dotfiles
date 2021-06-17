" Set colorscheme to darcula if you want to use darcula theme
" colorscheme: darcula if you want darcula
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'gitbranch' ],
      \            [ 'filename' ],
      \            [ 'git-information', 'ale' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
    \ }

" available component_function
" \   'git-information': 'plugin#lightline#GitInformation',
" \   'ale': 'plugin#lightline#AleLinterStatus',

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


