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

local map = vim.keymap.set

-- Easier split navigation, CTRL + hjlk
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize windows
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Remap for dealing with word wrap
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move selected lines up and down
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down", silent = true })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up", silent = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up", silent = true })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up", silent = true })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down", silent = true })

-- n/N always mean next/prev match regardless of search direction (/ vs ?) - vanilla Vim reverses them after a ? search
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Create empty space above/below
vim.cmd([[
nnoremap <silent> [<space> :<c-u>put!=repeat([''],v:count)<bar>']+1<CR>
nnoremap <silent> ]<space> :<c-u>put =repeat([''],v:count)<bar>'[-1<CR>
]])

-- Easy copy whole text in file
map("n", "vfy", "<Cmd>%y+<CR>", { desc = "copy whole file" })

-- Search within visual selection
map("x", "/", "<Esc>/\\%V")

-- Clear search
map({ "i", "n", "s" }, "<Esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Easier file save and exit
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<Cmd>q<CR>", { desc = "Exit" })
-- map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
-- map("n", "<leader>W", "<Cmd>x<CR>", { desc = "Save file and exit" })

-- Simply use ; instead of shift + :
map({ "n", "v" }, ";", ":")

-- Use this instead of touching Esc key
--map('i', { 'jk', 'kj' }, '<Esc>')

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- -- Disable copy while deleting
-- map({ "n", "x" }, "d", '"_d')
-- map("n", "dw", 'vb"_d')
-- map("n", "D", '"_D')
-- map("n", "x", '"_x')
-- map("x", "p", '"_dP')

map({ "n", "x" }, "<leader>d", '"_d')
map("x", "p", '"_dP')

-- Scroll the viewport faster
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")

-- Better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Don't jump when highlighting
map("n", "*", "*``")

-- Always keep in in the center of the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- map('n','n', 'nzz')
-- map('n','N', 'Nzz')

-- Cursor stops running away during line concatination
map("n", "J", "mzJ`z")

-- Tabs control
map("n", "<leader><tab>]", "<Cmd>tabnext<CR>", { desc = "Tab Right" })
map("n", "<leader><tab>[", "<Cmd>tabprev<CR>", { desc = "Tab Left" })
map("n", "<leader><tab>q", "<Cmd>tabclose<CR>", { desc = "Tab Close" })
map("n", "<leader><tab>1", "1gt<CR>", { desc = "Tab 1" })
map("n", "<leader><tab>2", "2gt<CR>", { desc = "Tab 2" })
map("n", "<leader><tab>3", "3gt<CR>", { desc = "Tab 3" })
map("n", "<leader><tab>4", "4gt<CR>", { desc = "Tab 4" })
map("n", "<leader><tab>5", "5gt<CR>", { desc = "Tab 5" })
map("n", "<leader><tab>6", "6gt<CR>", { desc = "Tab 6" })
map("n", "<leader><tab>7", "7gt<CR>", { desc = "Tab 7" })
map("n", "<leader><tab>8", "8gt<CR>", { desc = "Tab 8" })
map("n", "<leader><tab>9", "9gt<CR>", { desc = "Tab 9" })

map("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "properly indent on empty line when insert" })
