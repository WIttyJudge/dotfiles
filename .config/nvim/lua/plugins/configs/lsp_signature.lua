-- https://github.com/ray-x/lsp_signature.nvim
local lsp_signature = require("lsp_signature")

local config = {
	doc_lines = 0,
	fix_pos = true,
	hint_prefix = " ",
	hi_parameter = "Search",
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
}

lsp_signature.setup(config) -- no need to specify bufnr if you don't use toggle_key
