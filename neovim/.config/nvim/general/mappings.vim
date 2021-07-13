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

" Save on buttons
nnoremap <Leader>w :w<CR>
" Save and exit
nnoremap <Leader>W :x<CR>
" Exit
nnoremap <Leader>q :q<CR>

" Clean highliting after search
" nnoremap <Leader>; :nohlsearch<CR>

" Use simple ; instead of shift + :
nnoremap ; :
vnoremap ; :

" nnoremap <Leader>c q:i

" Resize windows
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up>    :resize +2<CR>

" Disable copy while deleting
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

" Use this instead of touching Esc key
inoremap jk <Esc>
inoremap kj <Esc>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Don't jump when highlighting
" nnoremap * *``

" Tabs control
nmap <Leader>tl :tabnext<CR>
nmap <Leader>th :tabprev<CR>
nmap <Leader>tq :tabclose<CR>

" ********* PLUGINS MAPPING *********

" nvim-hlslens
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *``<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

" suda.vim
cmap e!! e suda://%
cmap w!! w suda://%

" fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
nnoremap <Leader>ps :Rg<CR>

" telescope
" nnoremap <Leader>b <cmd>Telescope buffers<cr>
" nnoremap <leader>f :lua require('telescope.builtin').find_files({ hidden = true })<CR>
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string {}<CR>
" nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" nnoremap <leader>vrc :lua require('telescope.builtin').search_dotfiles()<CR>

" fern.vim
" nnoremap <C-b> :Fern . -drawer -toggle<CR><C-w>=

" nvim-tree.lua
nnoremap <C-b> :NvimTreeToggle<CR>

" vim-startify
nmap <Leader>st :Startify<CR>

" vim-fugitive
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gs :Git<CR>

" gv.vim
nmap <Leader>gc :GV<CR>
vnoremap <Leader>gc :GV<CR>
nmap <Leader>gC :GV!<CR>

" undotree
nmap <Leader>ut :UndotreeToggle<CR>

" termwrapper
nmap <Leader>ot :Ttoggle<CR>
tmap <Leader>ot <C-\><C-n>:Ttoggle<CR>

" LSP
" Expand or jump
imap <expr> <C-l> vsnip#available(1)? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

