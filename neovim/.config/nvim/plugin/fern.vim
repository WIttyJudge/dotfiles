" let g:fern#drawer_width = 30
" let g:fern#default_hidden = 1
" " Custom settings and mappings.
" let g:fern#disable_default_mappings = 1

" function! s:init_fern() abort
"   nmap <buffer><expr>
"         \ <Plug>(fern-my-open-expand-collapse)
"         \ fern#smart#leaf(
"         \   "\<Plug>(fern-action-open:select)",
"         \   "\<Plug>(fern-action-expand)",
"         \   "\<Plug>(fern-action-collapse)",
"         \ )

"   nmap <buffer><expr>
"         \ <Plug>(fern-my-collapse-or-leave)
"         \ fern#smart#drawer(
"         \   "\<Plug>(fern-action-collapse)",
"         \   "\<Plug>(fern-action-leave)",
"         \ )

"   " open
"   nmap <buffer><nowait> l <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
"   nmap <buffer><nowait> h <Plug>(fern-my-collapse-or-leave)
"   nmap <buffer> s <Plug>(fern-action-open:vsplit)
"   nmap <buffer> S <Plug>(fern-action-open:vsplit)<C-w>p
"   nmap <buffer> b <Plug>(fern-action-open:split)
"   nmap <buffer> t <Plug>(fern-action-open:tabedit)
"   nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
"   nmap <buffer><nowait> > <Plug>(fern-action-enter)
"   nmap <buffer><nowait> < <Plug>(fern-action-leave)

"   " create
"   nmap <buffer> nf <Plug>(fern-action-new-file)
"   nmap <buffer> nd <Plug>(fern-action-new-dir)
"   nmap <buffer> N <Plug>(fern-action-new-path)

"   nmap <buffer> r <Plug>(fern-action-rename)
"   nmap <buffer> R <Plug>(fern-action-reload)

"   nmap <buffer> dd <Plug>(fern-action-remove)

"   nmap <buffer> m <Plug>(fern-action-move)

"   nmap <buffer> c <Plug>(fern-action-copy)

"   " nmap <buffer> l <Plug>(fern-action-mark:toggle)j
" endfunction

" augroup fern-custom
"   autocmd! *
"   autocmd FileType fern call s:init_fern()

"   " start fern when vim started
"   autocmd VimEnter * ++nested Fern . -drawer

"   " glyph-palette.vim
"   autocmd FileType fern call glyph_palette#apply()
" augroup END

" let g:fern#renderer = "nerdfont"

" " fern-git-status.vim
" " Disable listing ignored files/directories
" " let g:fern_git_status#disable_ignored = 1

" " Disable listing untracked files
" " let g:fern_git_status#disable_untracked = 1

" " Disable listing status of submodules
" " let g:fern_git_status#disable_submodules = 1

" " Disable listing status of directories
" " let g:fern_git_status#disable_directories = 1
