-- https://github.com/ray-x/lsp_signature.nvim
local present, lsp_signature = pcall(require, "lsp_signature")

if not present then
	return
end

local config = {
	doc_lines = 0,
	fix_pos = true,
	hint_prefix = " ",
	hi_parameter = "Search",
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	handler_opts = {
		border = "rounded", -- double, single, shadow, none
	},
}

lsp_signature.setup(config) -- no need to specify bufnr if you don't use toggle_key
