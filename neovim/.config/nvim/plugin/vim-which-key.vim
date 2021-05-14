" HELP
" <C-f> = CTRL + f
" <A-j> = ALT + j

" ********* DEFINITION *********

" set leader key
let mapleader = "\<Space>"
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" which-key settings
let g:which_key_map =  {}
let g:which_key_timeout = 200
let g:which_key_sep = '→'
let g:which_key_hspace = 5
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" ********* SINGLE MAPPING *********

" Easier split navigation, CTRL + hjlk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy whole text in file
nnoremap va :%y+<CR>

" Clean hightliting after search
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

" fzf.vim
let g:which_key_map['f']  = [ ':Files'   , 'files' ]
let g:which_key_map['b']  = [ ':Buffers' , 'buffered files' ]
nnoremap <Leader>rg :Rg<CR>

" nerdtree
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" vim-startify
nmap <Leader>st :Startify<CR>

" coc-snippets
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

" ********* GROUP MAPPING *********

" *** Working with git ***
" vim-fugitive + vim-gitgutter
let g:which_key_map.g = {
     \ 'name' : '+git' ,
     \ 'd' : [':Gdiff', 'git diff'],
     \ 's' : [':Gstatus', 'git status'],
     \ 'c' : [':Commits', 'git log'],
     \ 'C' : [':BCommits', 'git log for current file'],
     \ 'j' : ['<Plug>(GitGutterNextHunk)', 'Jump to the next hunk'],
     \ 'k' : ['<Plug>(GitGutterPrevHunk)', 'Jump to the previous hunk'],
     \ 'u' : ['<Plug>(GitGutterUndoHunk)', 'Undo the hunk the cursor is in'],
     \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

