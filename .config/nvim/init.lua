--[[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
--]]

-- https://github.com/lewis6991/impatient.nvim
if pcall(require, "impatient") then
  require "impatient"
else
  vim.notify("impatient.nvim not installed", vim.log.levels.WARN)
end

require "core"

-- Packer package manager
require "plugins"
