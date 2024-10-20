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

--  +----------------------------------------------------------+
--  |                     Custom Mappings                      |
--  +----------------------------------------------------------+

-- Easier split navigation, CTRL + hjlk
map("n", "<C-j>", "<C-W><C-j>", { desc = "window down" })
map("n", "<c-k>", "<c-w><C-k>", { desc = "window up" })
map("n", "<C-l>", "<c-w><C-l>", { desc = "window left" })
map("n", "<C-h>", "<C-W><C-h>", { desc = "window right" })

-- Resize windows
map("n", "<UP>", "<Cmd>resize +2<CR>")
map("n", "<Down>", "<Cmd>resize -2<CR>")
map("n", "<Left>", "<Cmd>vertical resize +2<CR>")
map("n", "<Right>", "<Cmd>vertical resize -2<CR>")

-- Remap for dealing with word wrap
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Add space bellow or above without leaving normal mode
vim.cmd([[
nnoremap <silent> [<space> :<c-u>put!=repeat([''],v:count)<bar>']+1<CR>
nnoremap <silent> ]<space> :<c-u>put =repeat([''],v:count)<bar>'[-1<CR>
]])

-- Easy copy whole text in file
map("n", "vfy", "<Cmd>%y+<CR>", { desc = "copy whole file" })

-- Make an easier redo mapping
map("n", "U", "<C-R>")

-- Search within visual selection
map("x", "/", "<Esc>/\\%V")

-- Easier file save and exit
map("n", "<Leader>w", "<Cmd>update<CR>", { desc = "save file" })
map("n", "<Leader>W", "<Cmd>x<CR>", { desc = "save file and exit" })
map("n", "<Leader>q", "<Cmd>q<CR>", { desc = "exit" })
-- map("n", "<Leader>Q", "<Cmd>q!<CR>")

-- Clean highliting after search
-- nnoremap <Leader>; <Cmd>nohlsearch<CR>

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
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- map('n','n', 'nzz')
-- map('n','N', 'Nzz')

-- Cursor stops running away during line concatination
map("n", "J", "mzJ`z")

-- Tabs control
map("n", "<Leader>tl", "<Cmd>tabnext<CR>", { desc = "tab right" })
map("n", "<Leader>th", "<Cmd>tabprev<CR>", { desc = "tab left" })
map("n", "<Leader>tq", "<Cmd>tabclose<CR>", { desc = "tab close" })
map("n", "<Leader>t1", "1gt<CR>", { desc = "tab 1" })
map("n", "<Leader>t2", "2gt<CR>", { desc = "tab 2" })
map("n", "<Leader>t3", "3gt<CR>", { desc = "tab 3" })
map("n", "<Leader>t4", "4gt<CR>", { desc = "tab 4" })
map("n", "<Leader>t5", "5gt<CR>", { desc = "tab 5" })
map("n", "<Leader>t6", "6gt<CR>", { desc = "tab 6" })
map("n", "<Leader>t7", "7gt<CR>", { desc = "tab 7" })
map("n", "<Leader>t8", "8gt<CR>", { desc = "tab 8" })
map("n", "<Leader>t9", "9gt<CR>", { desc = "tab 9" })

map("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true, desc = "properly indent on empty line when insert" })

--  +----------------------------------------------------------+
--  |                     Plugins Mappings                     |
--  +----------------------------------------------------------+

local plugins_mappings = {
	-- chrisgrieser/nvim-spider
	nvim_spider = {
		{
			"w",
			"<Cmd>lua require('spider').motion('w')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-w",
		},
		{
			"e",
			"<Cmd>lua require('spider').motion('e')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-e",
		},
		{
			"b",
			"<Cmd>lua require('spider').motion('b')<CR>",
			mode = { "n", "o", "x" },
			desc = "Spider-b",
		},
	},
	-- numToStr/Comment.nvim
	comment_nvim = {
		{
			"<Leader>/",
			function ()require("Comment.api").toggle.linewise.current() end,
			mode = "n",
			desc = "Toggle comment"
		},
		{
			"<Leader>/",
			"<ESC><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			mode = "v",
			desc = "Toggle comment",
		}
	},
	-- kevinhwang91/nvim-hlslens
	nvim_hlslens = {
		{
			"n",
			"<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>",
		},
		{
			"N",
			"<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>",
		},
		{
			"*",
			"*``<Cmd>lua require('hlslens').start()<CR>",
		},
		{
			"#",
			"#<Cmd>lua require('hlslens').start()<CR>",
		},
		{
			"g*",
			"g*<Cmd>lua require('hlslens').start()<CR>"
		},
		{
			"g#",
			"g#<Cmd>lua require('hlslens').start()<CR>"
		},
	},
	-- nvim-neo-tree/neo-tree.nvim
	neo_tree = {
		{
			"<C-b>",
			"<Cmd>Neotree toggle<CR>",
			desc = "Toggle NvimTree",
		},
		{
			"<Leader>hf",
			"<Cmd>Neotree reveal<CR>",
			desc = "Find file inside tree",
		},
	},
	-- sindrets/diffview.nvim
	diffview = {
		{
			"<Leader>gc",
			"<Cmd>DiffviewFileHistory<CR>",
			desc = "Open diff view file history",
		},
	},
	-- Wansmer/treesj
	treesj = {
		{
			"gS",
			"<Cmd>TSJSplit<CR>",
			desc = "Treesj split line"
		},
		{
			"gJ",
			"<Cmd>TSJJoin<CR>",
			desc = "Treesj join line"
		},
	},
	-- phaazon/hop.nvim
	hop = {
		{
			"f",
			"<Cmd>HopChar2<CR>"
		},
	},
	-- nvim-telescope/telescope.nvim
	telescope = {
		-- {
		-- 	"<Leader>ff",
		-- 	function () require("telescope.builtin").find_files() end,
		-- 	desc = "Find files"
		-- },
		{
			"<Leader>ff",
			function () require("telescope").extensions.smart_open.smart_open() end,
			desc = "Find files"
		},
		{
			"<Leader>fo",
			function () require("telescope.builtin").oldfiles() end,
			desc = "Find oldfiles"
		},
		{
			"<Leader>fW",
			function () require("telescope.builtin").live_grep() end,
			desc = "Live grep"
		},
		{
			"<Leader>fc",
			function () require("telescope.builtin").grep_string() end,
			desc = "Find for word under cursor"
		},
		{
			"<Leader>fm",
			function () require("telescope.builtin").man_pages() end,
			desc = "Find man"
		},
		{
			"<Leader>fh",
			function ()
				require("telescope.builtin").help_tags()
			end,
			desc = "FInd neovim help"
		},
	},
}

-- nvim-hlslens
-- map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
-- map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>")
-- map("n", "*", "*``<Cmd>lua require('hlslens').start()<CR>", { silent = false })
-- map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", { silent = false })
-- map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", { silent = false })
-- map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", { silent = false })

-- nvim-tree.lua
-- map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "toggle nvimtree" })
-- map("n", "<Leader>hf", ":NvimTreeFindFile<CR>", { desc = "find file nvimtree" })

-- neo-tree.nvim
-- map("n", "<C-b>", "<Cmd>Neotree toggle<CR>", { desc = "toggle nvimtree" })
-- map("n", "<Leader>hf", "<Cmd>Neotree reveal<CR>", { desc = "find file inside tree" })

-- telescope.nvim
-- map("n", "<Leader>ff", function()
-- 	require("telescope.builtin").find_files()
-- end, { desc = "Find files" })

-- map("n", "<Leader>ff", function ()
--   require("telescope").extensions.smart_open.smart_open()
-- end, { desc = "Find files" })
--
-- map("n", "<Leader>fo", function()
-- 	require("telescope.builtin").oldfiles()
-- end, { desc = "Find oldfiles" })
--
-- map("n", "<Leader>fW", function()
-- 	require("telescope.builtin").live_grep()
-- end, { desc = "Live grep" })
--
-- map("n", "<Leader>fc", function()
-- 	require("telescope.builtin").grep_string()
-- end, { desc = "Find for word under cursor" })
--
-- map("n", "<Leader>fm", function()
-- 	require("telescope.builtin").man_pages()
-- end, { desc = "Find man" })
--
-- map("n", "<Leader>fh", function()
-- 	require("telescope.builtin").help_tags()
-- end)

-- map("n", "<Leader>ca", function()
--   require("plugins.configs.telescope").lsp_code_actions()
-- end)

-- diffview.nvim
-- map({ "n", "v" }, "<Leader>gc", "<Cmd>DiffviewFileHistory<CR>")

-- treesj
-- map("n", "gS", ":TSJSplit<CR>")
-- map("n", "gJ", ":TSJJoin<CR>")

-- hop.nvim
-- map("n", "f", "<Cmd>HopChar2<CR>")

-- nvim-dap
-- map("n", "<Leader>db", function()
-- 	require("dap").toggle_breakpoint()
-- end, { desc = "Toggle Breakpoint" })
--
-- map("n", "<Leader>dB", function()
-- 	require("dap").clear_breakpoints()
-- end, { desc = "Clear Breakpoint" })
--
-- map("n", "<Leader>dc", function()
-- 	require("dap").continue()
-- end, { desc = "Start / Continue" })
--
-- map("n", "<Leader>dq", function()
-- 	require("dap").close()
-- end, { desc = "Close session" })
--
-- map("n", "<Leader>dQ", function()
-- 	require("dap").terminate()
-- end, { desc = "Terminate session" })

-- map("n", "<Leader>dp", function()
--   require("dap").pause()
-- end, { desc = "Pause" })

-- map("n", "<Leader>dr", function()
--   require("dap").restart_frame()
-- end, { desc = "Restart Frame" })

-- map("n", "<Leader>dR", function()
-- 	require("dap").repl.toggle()
-- end, { desc = "Toggle REPL" })
--
-- map("n", "<Leader>ds", function()
-- 	require("dap").run_to_cursor()
-- end, { desc = "Run To Cursor" })
--
-- map("n", "<Leader>dC", function()
-- 	vim.ui.input({ prompt = "Condition: " }, function(condition)
-- 		if condition then
-- 			require("dap").set_breakpoint(condition)
-- 		end
-- 	end)
-- end, { desc = "Conditional Breakpoint" })
--
-- map("n", "<Leader>di", function()
-- 	require("dap").step_into()
-- end, { desc = "Step Into" })
--
-- map("n", "<Leader>do", function()
-- 	require("dap").step_over()
-- end, { desc = "Step Over" })
--
-- map("n", "<Leader>dO", function()
-- 	require("dap").step_out()
-- end, { desc = "Step Out" })

-- text-case.nvim
-- map("n", "<Leader>gas", function()
-- 	require("textcase").current_word("to_snake_case")
-- end, { desc = "To Snake case" })
--
-- map("n", "<Leader>gac", function()
-- 	require("textcase").current_word("to_camel_case")
-- end, { desc = "To Camel case" })

return plugins_mappings
