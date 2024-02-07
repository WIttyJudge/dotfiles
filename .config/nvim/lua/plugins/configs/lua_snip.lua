-- https://github.com/L3MON4D3/LuaSnip
local luasnip = require("luasnip")

local options = {
	history = true,
}

luasnip.config.set_config(options)
luasnip.filetype_extend("ruby", { "rails" })

-- To use existing vs-code style snippets from a plugin (eg. rafamadriz/friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()
