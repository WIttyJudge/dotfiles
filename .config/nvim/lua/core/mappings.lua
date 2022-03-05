-- HELP
-- <C-f> = CTRL + f
-- Read more about mappings
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

local map = require('custom.utils').map

-- Set leader key
vim.g.mapleader = ' '

-- ********* CUSTOM MAPPING *********

-- Easier split navigation, CTRL + hjlk
map('n', '<C-j>', '<C-W><C-j>')
map('n', '<c-k>', '<c-w><C-k>')
map('n', '<C-l>', '<c-w><C-l>')
map('n', '<C-h>', '<C-W><C-h>')

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Add space bellow or above without leaving normal mode
vim.cmd([[
nnoremap <silent> [<space> :<c-u>put!=repeat([''],v:count)<bar>']+1<CR>
nnoremap <silent> ]<space> :<c-u>put =repeat([''],v:count)<bar>'[-1<CR>
]])

-- Easy copy whole text in file
map('n', 'vfy', ':%y+<CR>')

-- Make an easier redo mapping
map('n', 'U', '<C-R>')

-- Easier file save and exit
map('n', '<Leader>w', ':w<CR>')
map('n', '<Leader>W', ':x<CR>')
map('n', '<Leader>q', ':q<CR>')
map('n', '<Leader>Q', ':q!<CR>')

-- Clean highliting after search
-- nnoremap <Leader>; :nohlsearch<CR>

-- Use simple ; instead of shift + :
map('n', ';', ':', { silent = false })
map('v', ';', ':', { silent = false })

-- Use this instead of touching Esc key
-- I use better-escape.nvim  plugins!!!
-- map('i', 'jk', '<Esc>')
-- map('i', 'kj', '<Esc>')

-- Move selected lines up and down
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Tab to switch buffers
-- map('n', '<Leader>b', ':bprevious<CR>')
-- map('n', '<Leader>B', ':bnext<CR>')

-- map('n', '<Leader>c', 'q:i')

-- Resize windows
map('n', '<UP>', ':resize +2<CR>')
map('n', '<Down>', ':resize -2<CR>')
map('n', '<Left>', ':vertical resize +2<CR>')
map('n', '<Right>', ':vertical resize -2<CR>')

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Disable copy while deleting
map('n', 'd', '"_d')
map('x', 'd', '"_d')
map('n', 'D', '"_D')
map('n', 'x', '"_x')
map('x', 'p', '"_dP')

-- Scroll the viewport faster
map('n', '<C-e>', '3<C-e>')
map('n', '<C-y>', '3<C-y>')

-- Better tabbing
map('v', '>', '>gv')
map('v', '<', '<gv')

-- buffer navigation
-- map('n', '<leader>bh', ':bprev<cr>')
-- map('n', '<leader>bl', ':bnext<cr>')

-- Don't jump when highlighting
-- map('n','*', '*``')

-- Always keep in in the center of the screen
-- map('n','n', 'nzz')
-- map('n','N', 'Nzz')

-- Cursor stops running away during line concatination 
map('n','J', 'mzJ`z')

-- Tabs control
map('n', '<Leader>tl', ':tabnext<CR>')
map('n', '<Leader>th', ':tabprev<CR>')
map('n', '<Leader>tq', ':tabclose<CR>')
map('n', '<Leader>t1', '1gt<CR>')
map('n', '<Leader>t2', '2gt<CR>')
map('n', '<Leader>t3', '3gt<CR>')
map('n', '<Leader>t4', '4gt<CR>')
map('n', '<Leader>t5', '5gt<CR>')
map('n', '<Leader>t6', '6gt<CR>')
map('n', '<Leader>t7', '7gt<CR>')
map('n', '<Leader>t8', '8gt<CR>')
map('n', '<Leader>t9', '9gt<CR>')

-- Open terminal
-- nmap <Leader>tt :vnew term://zsh <CR>
map('n', '<Leader>tt', ':split term://zsh | resize 20<CR> | a<CR>')
-- tmap <Leader>ot <C-\><C-n>:Ttoggle<CR>

-- ********* PLUGINS MAPPING *********

-- nvim-comment
map('n', '<Leader>/', ':CommentToggle<CR>')
map('v', '<Leader>/', ':CommentToggle<CR>')

-- nvim-hlslens
map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
map('n', '*', "*``<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { silent = false })

-- nvim-tree.lua
map('n', '<C-b>', ':NvimTreeToggle<CR>')
map('n', '<Leader>hf', ':NvimTreeFindFile<CR>')

-- fzf.vim
-- map('', '<Leader>f', ':Files<CR>')
-- map('', '<Leader>b', ':Buffers<CR>')
-- map('n', '<Leader>ps', ':Rg<CR>')

-- telescope
map('n', '<Leader>f', ':lua require("plugins-config.telescope").find_all_files()<CR>')
map('n', '<Leader>b', ':lua require("telescope.builtin").buffers()<CR>')

map('n', '<Leader>ps', ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<Leader>pc', ':lua require("telescope.builtin").grep_string()<CR>')
map('n', '<Leader>pf', ':lua require("telescope.builtin").live_grep({grep_open_files=true})<CR>')

map('n', '<Leader>gb', ':lua require("plugins-config/telescope").git_branches()<CR>')
map('n', '<Leader>ca', ':lua require("plugins-config/telescope").lsp_code_actions()<CR>')

-- undotree
map('n', '<Leader>ut', ':UndotreeToggle<CR>')

-- vim-startify
-- map('n', '<Leader>st', ':tabnew | :Startify<CR>')

-- alpha-nvim
map('n', '<Leader>st', ':tabnew | :Alpha<CR>')

-- vim-test
map('n', '<Leader>tf', ':TestFile<CR>')
map('n', '<Leader>tn', ':TestNearest<CR>')

-- vim-fugitive
map('n', '<Leader>gd', ':Gvdiffsplit<CR>')
map('n', '<Leader>gs', ':Git<CR>')

-- gv.vim
map('n', '<Leader>gc', ':GV<CR>')
map('v', '<Leader>gc', ':GV<CR>')
map('n', '<Leader>gC', ':GV!<CR>')

-- suda.vim
map('c', 'e!!', 'e suda://%', { silent = false })
map('c', 'w!!', 'w suda://%', { silent = false })

-- hop.nvim
map('n', 'f', "<CMD>:HopChar1<CR>")

-- map('n', '<Leader>mz', ":FocusMaximise<CR>")
