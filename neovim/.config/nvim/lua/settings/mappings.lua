-- HELP
-- <C-f> = CTRL + f
-- <A-j> = ALT + j

-- Read more about mappings
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

local function set_keymap(mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true}

  local opts = opts or {}

  -- rewrite default_opts if opts defined
  default_opts = vim.tbl_extend("force", default_opts, opts)

  vim.api.nvim_set_keymap(mode, lhs, rhs, default_opts)
end

-- Set leader key
vim.g.mapleader = ' '

-- ********* CUSTOM MAPPING *********

-- Easier split navigation, CTRL + hjlk
set_keymap('n', '<C-J>', '<C-W><C-J>')
set_keymap('n', '<C-K>', '<C-W><C-K>')
set_keymap('n', '<C-L>', '<C-W><C-L>')
set_keymap('n', '<C-H>', '<C-W><C-H>')

-- Easy copy whole text in file
-- set_keymap('n', 'va', ':%y+<CR>')

-- Easy select all of file
set_keymap('n', 'va', 'GVgg^')

-- Easier file save
set_keymap('n', '<Leader>w', ':w<CR>')
-- Save and exit
set_keymap('n', '<Leader>W', ':x<CR>')
-- Exit
set_keymap('n', '<Leader>q', ':q<CR>')

-- Clean highliting after search
-- nnoremap <Leader>; :nohlsearch<CR>

-- Use simple ; instead of shift + :
set_keymap('n', ';', ':', { silent = false })
set_keymap('v', ';', ':', { silent = false })

-- Use this instead of touching Esc key
set_keymap('i', 'jk', '<Esc>')
set_keymap('i', 'kj', '<Esc>')

-- Tab to switch buffers
-- set_keymap('n', '<Leader>b', ':bprevious<CR>')
-- set_keymap('n', '<Leader>B', ':bnext<CR>')

-- set_keymap('n', '<Leader>c', 'q:i')

-- Resize windows
set_keymap('n', '<UP>', ':vertical resize +2<CR>')
set_keymap('n', '<Down>', ':resize -2<CR>')
set_keymap('n', '<Left>', ':vertical resize +2<CR>')
set_keymap('n', '<Right>', ':vertical resize -2<CR>')

-- Make visual yanks place the cursor back where started
set_keymap("v", "y", "ygv<Esc>")

-- Disable copy while deleting
set_keymap('n', 'd', '"_d')
set_keymap('x', 'd', '"_d')
set_keymap('x', 'p', '"_dP')

-- Scroll the viewport faster
set_keymap('n', '<C-e>', '3<C-e>')
set_keymap('n', '<C-y>', '3<C-y>')

-- Better tabbing
set_keymap('v', '>', '>gv')
set_keymap('v', '<', '<gv')

-- Don't jump when highlighting
-- set_keymap('n','*', '*``')

-- Tabs control
set_keymap('n', '<Leader>tl', ':tabnext<CR>')
set_keymap('n', '<Leader>th', ':tabprev<CR>')
set_keymap('n', '<Leader>tq', ':tabclose<CR>')

-- ********* PLUGINS MAPPING *********

-- nvim-hlslens
set_keymap('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
set_keymap('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
set_keymap('n', '*', "*``<Cmd>lua require('hlslens').start()<CR>", { silent = false })
set_keymap('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { silent = false })
set_keymap('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { silent = false })
set_keymap('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { silent = false })

-- suda.vim
set_keymap('c', 'e!!', 'e suda://%', { silent = false })
set_keymap('c', 'w!!', 'w suda://%', { silent = false })

-- fzf.vim
set_keymap('', '<Leader>f', ':Files<CR>')
set_keymap('', '<Leader>b', ':Buffers<CR>')
set_keymap('n', '<Leader>ps', ':Rg<CR>')

-- telescope
-- nnoremap <leader>f :Telescope find_files<CR>
-- nnoremap <Leader>b <cmd>Telescope buffers<cr>
-- nnoremap <leader>ps :lua require('telescope.builtin').grep_string {}<CR>
-- nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

-- nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
-- nnoremap <leader>vrc :lua require('telescope.builtin').search_dotfiles()<CR>

-- nvim-tree.lua
set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>')
-- fern.vim
-- nnoremap <C-b> :Fern . -drawer -toggle<CR><C-w>=

-- vim-startify
set_keymap('n', '<Leader>st', ':Startify<CR>')

-- vim-fugitive
set_keymap('n', '<Leader>gd', ':Gdiff<CR>')
set_keymap('n', '<Leader>gs', ':Git<CR>')

-- gv.vim
set_keymap('n', '<Leader>gc', ':GV<CR>')
set_keymap('v', '<Leader>gc', ':GV<CR>')
set_keymap('n', '<Leader>gC', ':GV!<CR>')

-- undotree
set_keymap('n', '<Leader>ut', ':UndotreeToggle<CR>')

-- nvim-comment
set_keymap('n', '<Leader>/', ':CommentToggle<CR>')
set_keymap('v', '<Leader>/', ':CommentToggle<CR>')

-- nmap <Leader>tt :vnew term://zsh <CR>
set_keymap('n', '<Leader>tt', ':split term://zsh | resize 25<CR>')
-- tmap <Leader>ot <C-\><C-n>:Ttoggle<CR>

-- LSP
-- Expand or jump
vim.cmd([[
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]])
