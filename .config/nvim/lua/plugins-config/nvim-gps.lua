 -- https://github.com/SmiteshP/nvim-gps

local config = {
  languages = {
		["fennel"] = false,
		["go"] = false,
		["java"] = false,
		["javascript"] = false,
		["lua"] = false,
		["php"] = false,
		["python"] = false,
		["ruby"] = false,
		["rust"] = false,
		["rust"] = false,
		["typescript"] = false,

    ["html"] = true,
		["json"] = true,
		["toml"] = true,
		["yaml"] = true,
	},
}

require("nvim-gps").setup(config)
