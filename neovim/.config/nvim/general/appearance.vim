" Theme
if has("termguicolors")     " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark

" If you want to configure gruvbox theme, read it:
" https://github.com/morhetz/gruvbox/wiki/Configuration#ggruvbox_contrast_dark
 " let g:gruvbox_contrast_dark = 'medium'
 let g:gruvbox_transparent_bg = 1
 " let g:gruvbox_termcolors = 16

colorscheme gruvbox
" colorscheme nord

" hi! Normal ctermbg=NONE
" hi! NonText ctermbg=NONE

autocmd SourcePost * highlight Normal ctermbg=NONE guibg=NONE
      	\ |    highlight LineNr ctermbg=NONE guibg=NONE
