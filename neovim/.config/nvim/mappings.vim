" Custom Mappings

" set leader key
let mapleader = "\<Space>"
" let mapleader = ";"

" Basic
" Easier split navigation
noremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>

" fzf.vim
map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>

" vim-gitgutter
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" vim-rspec
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

