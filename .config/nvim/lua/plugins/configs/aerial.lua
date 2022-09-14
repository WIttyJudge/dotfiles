-- https://github.com/stevearc/aerial.nvim
local present, aerial = pcall(require, "aerial")

if not present then
	return
end

aerial.setup()
