-- https://github.com/hoob3rt/lualine.nvim
local lualine = require("lualine")
local icons = require("internal.icons")

local diff = {
	"diff",
	symbols = {
		added = icons.git.Add .. " ",
		modified = icons.git.Modify .. " ",
		removed = icons.git.Remove .. " ",
	},
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warn .. " ",
		info = icons.diagnostics.Info .. " ",
	},
}

local nvim_navic = {
	function()
		return require("nvim-navic").get_location()
	end,
	cond = function()
		return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
	end,
}

local branch = {
	"branch",
	icon = icons.git.Branch,
}

local config = {
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", diff, diagnostics },
		lualine_c = { nvim_navic },
		lualine_x = { branch, "filetype" },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
}

lualine.setup(config)
