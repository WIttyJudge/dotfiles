 -- https://github.com/SmiteshP/nvim-gps
local present, nvim_gps = pcall(require, "nvim-gps")

if not present then
  return
end

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
		["typescript"] = false

		--     ["html"] = true,
		-- ["json"] = true,
		-- ["toml"] = true,
		-- ["yaml"] = true,
	},
}

nvim_gps.setup(config)
