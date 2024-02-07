-- https://github.com/lukas-reineke/indent-blankline.nvim
local ibl = require("ibl")

local config = {
	exclude = {
		filetypes = {
			"help",
			"man",
			"NvimTree",
			"Trouble",
			"dashboard",
			"alpha",
			"terminal",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"lsp-installer",
			"mason",
			"lazy",
			"",
		},
	},
	indent = {
		char = "│",
	},
	scope = {
		enabled = false,
	},
}

ibl.setup(config)
