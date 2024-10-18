-- https://github.com/goolord/alpha-nvim
local alpha = require("alpha")

local icons = require("internal.icons")

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 36,
		align_shortcut = "right",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local options = {}

options.header = {
	type = "text",
	val = {
		"                                                     ",
		"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                     ",
	},
	opts = {
		position = "center",
		hl = "AlphaHeader",
	},
}

options.buttons = {
	type = "group",
	val = {
		button("o", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
		button("f", icons.ui.Search .. " Find file", ":Telescope smart_open <CR>"),
		button("w", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
		-- button("s", icons.ui.SignIn .. " Find Session", ":Telescope sessions save_current=false <CR>"),
		button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", icons.diagnostics.Error .. "Quit", ":qa<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

alpha.setup({
	layout = {
		{ type = "padding", val = 9 },
		options.header,
		{ type = "padding", val = 2 },
		options.buttons,
	},
	opts = {},
})
