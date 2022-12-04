-- HELP
-- <C-f> = CTRL + f
-- Read more about mappings
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local map = require("internal.utils").map

--Remap space as leader key
map("", "<Space>", "<Nop>")
-- Set leader key
vim.g.mapleader = " "

-- ********* CUSTOM MAPPING *********

-- Easier split navigation, CTRL + hjlk
map("n", "<C-j>", "<C-W><C-j>", { desc = "window down" })
map("n", "<c-k>", "<c-w><C-k>", { desc = "window up" })
map("n", "<C-l>", "<c-w><C-l>", { desc = "window left" })
map("n", "<C-h>", "<C-W><C-h>", { desc = "window right" })

-- Resize windows
map("n", "<UP>", ":resize +2<CR>")
map("n", "<Down>", ":resize -2<CR>")
map("n", "<Left>", ":vertical resize +2<CR>")
map("n", "<Right>", ":vertical resize -2<CR>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Add space bellow or above without leaving normal mode
vim.cmd [[
nnoremap <silent> [<space> :<c-u>put!=repeat([''],v:count)<bar>']+1<CR>
nnoremap <silent> ]<space> :<c-u>put =repeat([''],v:count)<bar>'[-1<CR>
]]

-- Easy copy whole text in file
map("n", "vfy", ":%y+<CR>", { desc = "copy whole file" })

map("n", "<Leader>r", function()
  require("internal.quickrun").run_command()
end, { desc = "run command" })

-- Make an easier redo mapping
map("n", "U", "<C-R>")

-- Easier file save and exit
map("n", "<Leader>w", ":w<CR>", { desc = "save file" })
map("n", "<Leader>W", ":x<CR>", { desc = "save file and exit" })
map("n", "<Leader>q", ":q<CR>", { desc = "exit" })
-- map("n", "<Leader>Q", ":q!<CR>")

-- Clean highliting after search
-- nnoremap <Leader>; :nohlsearch<CR>

-- Use simple ; instead of shift + :
map({ "n", "v" }, ";", ":", { silent = false })

-- Use this instead of touching Esc key
--map('i', { 'jk', 'kj' }, '<Esc>')

-- Move selected lines up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Disable copy while deleting
map({ "n", "x" }, "d", '"_d')
map("n", "dw", 'vb"_d')
map("n", "D", '"_D')
map("n", "x", '"_x')
map("x", "p", '"_dP')

-- Scroll the viewport faster
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")

-- Better tabbing
map("n", ">", ">>")
map("n", "<", "<<")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Don't jump when highlighting
-- map('n','*', '*``')

-- Always keep in in the center of the screen
-- map('n','n', 'nzz')
-- map('n','N', 'Nzz')

-- Cursor stops running away during line concatination
map("n", "J", "mzJ`z")

-- Tabs control
map("n", "<Leader>tl", ":tabnext<CR>", { desc = "tab right" })
map("n", "<Leader>th", ":tabprev<CR>", { desc = "tab left" })
map("n", "<Leader>tq", ":tabclose<CR>", { desc = "tab close" })
map("n", "<Leader>t1", "1gt<CR>", { desc = "tab 1" })
map("n", "<Leader>t2", "2gt<CR>", { desc = "tab 2" })
map("n", "<Leader>t3", "3gt<CR>", { desc = "tab 3" })
map("n", "<Leader>t4", "4gt<CR>", { desc = "tab 4" })
map("n", "<Leader>t5", "5gt<CR>", { desc = "tab 5" })
map("n", "<Leader>t6", "6gt<CR>", { desc = "tab 6" })
map("n", "<Leader>t7", "7gt<CR>", { desc = "tab 7" })
map("n", "<Leader>t8", "8gt<CR>", { desc = "tab 8" })
map("n", "<Leader>t9", "9gt<CR>", { desc = "tab 9" })

-- Open terminal
-- nmap <Leader>tt :vnew term://zsh <CR>
-- map("n", "<Leader>tt", ":split term://zsh | resize 20<CR> | a<CR>")
-- tmap <Leader>ot <C-\><C-n>:Ttoggle<CR>

-- ********* PLUGINS MAPPING *********

-- nvim-comment
-- map({ 'n', 'v' }, '<Leader>/', ':CommentToggle<CR>')

-- Comment.nvim
map("n", "<Leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "toggle comment" })

map(
  "v",
  "<Leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "toggle comment" }
)

-- nvim-hlslens
map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
map("n", "*", "*``<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", { silent = false })
map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", { silent = false })

-- nvim-tree.lua
map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "toggle nvimtree" })
map("n", "<Leader>hf", ":NvimTreeFindFile<CR>", { desc = "find file nvimtree" })

-- telescope
-- vim.keymap.set('n', '<Leader>f', function() require("plugins.configs.telescope").find_all_files() end)

map("n", "<Leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "find fles" })

map("n", "<Leader>fo", function()
  require("telescope.builtin").oldfiles()
end, { desc = "find oldfiles" })

map("n", "<Leader>fW", function()
  require("telescope.builtin").live_grep()
end, { desc = "live grep" })

map("n", "<Leader>fc", function()
  require("telescope.builtin").grep_string()
end, { desc = "grep by word under cursor" })

map("n", "<F1>", function()
  require("telescope.builtin").help_tags()
end)

-- map("n", "<Leader>gb", function()
--   require("plugins.configs.telescope").git_branches()
-- end)
--
-- map("n", "<Leader>ca", function()
--   require("plugins.configs.telescope").lsp_code_actions()
-- end)

-- undotree
map("n", "<Leader>ut", ":UndotreeToggle<CR>")

-- alpha-nvim
map("n", "<Leader>st", ":tabnew | :Alpha<CR>")

-- vim-fugitive
map("n", "<Leader>gd", ":Gvdiffsplit<CR>", {desc = "git dif"})
map("n", "<Leader>gs", ":Git<CR>", {desc = "git menu"})

-- gv.vim
map({ "n", "v" }, "<Leader>gc", ":GV<CR>")
map("n", "<Leader>gC", ":GV!<CR>")

-- suda.vim
map("c", "e!!", "e suda://%", { silent = false })
map("c", "w!!", "w suda://%", { silent = false })

-- hop.nvim
map("n", "f", "<CMD>HopChar2<CR>")
