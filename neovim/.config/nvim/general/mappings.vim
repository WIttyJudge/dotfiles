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
" nnoremap <F2> :NERDTreeFind<CR>

" vim-startify
nmap <Leader>st :Startify<CR>

" vim-gitgutter
nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)
nmap <Leader>gu :SignifyHunkUndo<CR>

" vim-fugitive
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gs :Git<CR>
" nmap <Leader>gc :Commits<CR>
" nmap <Leader>gC :BCommits<CR>

" gv.vim
nmap <Leader>gc :GV<CR>
vnoremap <Leader>gc :GV<CR>
nmap <Leader>gC :GV!<CR>

" undotree
nmap <Leader>ut :UndotreeToggle<CR>

" LSP
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" lspsaga
" nnoremap <silent><leader>clf :Lspsaga lsp_finder<CR>
" nnoremap <silent><leader>cca :Lspsaga code_action<CR>
" vnoremap <silent><leader>cca :<C-U>Lspsaga range_code_action<CR>
" nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
" nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
" nnoremap <silent><leader>crn :Lspsaga rename<CR>
" nnoremap <silent><leader>cpd :Lspsaga preview_definition<CR>
" nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
" nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
" tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
