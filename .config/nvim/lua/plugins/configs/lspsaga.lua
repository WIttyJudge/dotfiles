-- https://github.com/glepnir/lspsaga.nvim
local present, lspsaga = pcall(require, "lspsaga")

if not present then
	return
end

local icons = require("internal.icons")

local config = {
	error_sign = icons.error,
	warn_sign = icons.warn,
	hint_sign = icons.hint,
	infor_sign = icons.info,
}

lspsaga.init_lsp_saga(config)
