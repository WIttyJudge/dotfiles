" CUSTOM MAPPINGS

function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

" set leader key
let mapleader = "\<Space>"
" let mapleader = ";"

" ********* BASIC *********

" Easier split navigation, CTRL + hjlk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use this instead of touching Esc key
inoremap jk <Esc>
inoremap kj <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" ********* FUNCTIONS *********

noremap <silent> <A-j> :call AddEmptyLineBelow()<CR>

" ********* PLUGINS *********

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

" vim-fugitive
nmap <Leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR><C-w>10-

" vim-rspec
" You can run RSpec only if ruby filetype is defined.
" Look and ftplugin/ruby.vim
