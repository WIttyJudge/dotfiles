" HELP
" <C-f> = CTRL + f
" <A-j> = ALT + j

" ********* FUNCTIONS *********

function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

noremap <silent> <A-j> :call AddEmptyLineBelow()<CR>

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

" Disable copy while deleting
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

" Use this instead of touching Esc key
inoremap jk <Esc>
inoremap kj <Esc>

" nmap <Capslock> <Esc>

" Tabs
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" fzf.vim
let g:which_key_map['f']  = [ ':Files'   , 'files' ]
let g:which_key_map['b']  = [ ':Buffers' , 'buffered files' ]
nnoremap <Leader>rg :Rg<CR>

" nerdtree
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" function for running code file in terminal
function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby nmap <Leader>e :call RunWith("ruby")<cr>

" vim-startify
nmap <Leader>st :Startify<CR>

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

