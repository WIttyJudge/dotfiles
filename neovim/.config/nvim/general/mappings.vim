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
inoremap jk <Esc>
" inoremap kj <Esc>

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
nmap <Leader>gc :Commits<CR>
nmap <Leader>gC :BCommits<CR>

" coc.nvim
" nmap <leader>F2 <Plug>(coc-rename)
" " Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = 'TAB>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<S-Tab>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

