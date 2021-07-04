" Theme
if has("termguicolors")     " set true colors
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  let &t_8f = "[[38;2;%lu;%lu;%lum"
  let &t_8b = "[[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_sign_column_background = 'none'
color gruvbox-material

" hi! Normal ctermbg=NONE
" hi! NonText ctermbg=NONE

" autocmd SourcePost * highlight Normal ctermbg=NONE guibg=NONE
"       	\ |    highlight LineNr ctermbg=NONE guibg=NONE
