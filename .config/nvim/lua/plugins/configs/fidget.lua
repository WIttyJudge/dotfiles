-- https://github.com/j-hui/fidget.nvim
local present, fidget = pcall(require, "fidget")

if not present then
  return
end

local config = {
  window = {
    -- adjust transparency.
    blend = 0,
  },
}

fidget.setup(config)
