-- https://github.com/norcalli/nvim-colorizer.lua
local present, colorizer = pcall(require, "colorizer")

if not present then
  return
end

require("colorizer").setup()
