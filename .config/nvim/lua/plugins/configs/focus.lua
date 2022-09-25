-- https://github.com/beauwilliams/focus.nvim
local present, focus = pcall(require, "focus")

if not present then
  return
end

local config = {
  enabled = true,
  signcolumn = false,
}

focus.setup(config)
