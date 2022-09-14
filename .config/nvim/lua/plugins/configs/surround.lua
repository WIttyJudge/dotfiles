-- https://github.com/blackCauldron7/surround.nvim
local present, surround = pcall(require, "surround")

if not present then
	return
end

local config = {
	context_offset = 500,
}

surround.setup(config)
