-- https://github.com/LunarVim/bigfile.nvim
local bigfile = require("bigfile")

local config = {
	pattern = function(bufnr, filesize_mib)
		-- you can't use `nvim_buf_line_count` because this runs on BufReadPre
		local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
		local file_length = #file_contents
		local filetype = vim.filetype.match({ buf = bufnr })

		if file_length > 1000 and filetype == "java" then
			return true
		end
	end,
	features = {
		"indent_blankline",
		"illuminate",
		"lsp",
		"treesitter",
		-- "syntax",
		"matchparen",
		-- "vimopts",
		-- "filetype",
	},
}

bigfile.setup(config)
