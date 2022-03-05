-- https://github.com/luukvbaal/stabilize.nvim

local config = {
	force = true,
	forcemark = nil,
  ignore = {
		filetype = { "help", "list", "Trouble", "fugitive" },
		buftype = { "terminal", "quickfix", "loclist" }
	},
	nested = nil,
}

require("stabilize").setup(config)
