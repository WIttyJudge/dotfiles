" CUSTOM MAPPINGS
" <C-f> = CTRL + f
" <A-j> = ALT + j

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

" Copy whole text in file
nnoremap va :%y+<CR>

" Clean hightliting after search
nnoremap <Leader>; :nohlsearch<CR>

" Disable copy while deleting
nnoremap d "_d
vnoremap d "_d

" Use this instead of touching Esc key
inoremap jk <Esc>
inoremap kj <Esc>

" Tags
nmap <Leader>tl :tabnext<CR>
nmap <Leader>th :tabprev<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" ********* FUNCTIONS *********

noremap <silent> <A-j> :call AddEmptyLineBelow()<CR>

" ********* PLUGINS *********

" nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>

" fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
nnoremap <Leader>rg :Rg<CR> 
" nmap <Leader>gc :Commits<CR>
" nmap <Leader>gfc :BCommits<CR>

" vim-gitgutter
" nmap <Leader>gn <Plug>(GitGutterNextHunk)
" nmap <Leader>gp <Plug>(GitGutterPrevHunk)
" nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" vim-fugitive
" nmap <Leader>gd :Gdiff<CR>
" nmap <Leader>gs :Gstatus<CR><C-w>

" vim-rspec
" You can run RSpec only if ruby filetype is defined.
" Look and ftplugin/ruby.vim

" vim-unimpaired
" nmap <A-k> [egv
" nmap <A-j> ]egv
