" HELP
" <C-f> = CTRL + f
" <A-j> = ALT + j

" set leader key
let mapleader = "\<Space>"

" ********* CUSTOM MAPPING *********

" Easier split navigation, CTRL + hjlk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy whole text in file
nnoremap va :%y+<CR>

" Clean highliting after search
nnoremap <Leader>; :nohlsearch<CR>

" Use simple ; instead of shift + :
nnoremap ; :
vnoremap ; :

" Disable copy while deleting
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

" Use this instead of touching Esc key
" inoremap jk <Esc>
inoremap kj <Esc>

" Use Delete button instead of Esc
nnoremap <Del> <Esc>
vnoremap <Del> <Esc>gV
onoremap <Del> <Esc>
cnoremap <Del> <C-C><Esc>
inoremap <Del> <Esc>`^
inoremap <Leader><Tab> <Tab>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Tabs
nmap <Leader>tl :tabnext<CR>
nmap <Leader>th :tabprev<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" ********* PLUGINS MAPPING *********

" fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
nnoremap <Leader>ps :Rg<CR>

" nerdtree
nnoremap <C-b> :NERDTreeTabsToggle<CR>
nnoremap <F2> :NERDTreeFind<CR>

" vim-startify
nmap <Leader>st :Startify<CR>

" vim-gitgutter
nmap <Leader>gj <Plug>(GitGutterNextHunk)
nmap <Leader>gk <Plug>(GitGutterPrevHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" vim-fugitive
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gs :Gstatus<CR>
" nmap <Leader>gc :Commits<CR>
" nmap <Leader>gC :BCommits<CR>

" gv.vim
nmap <Leader>gc :GV<CR>
vnoremap <Leader>gc :GV<CR>
nmap <Leader>gC :GV!<CR>

" undotree
nmap <Leader>ut :UndotreeToggle<CR>

