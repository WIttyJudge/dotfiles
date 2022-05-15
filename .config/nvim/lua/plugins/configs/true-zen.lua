-- https://github.com/Pocco81/TrueZen.nvim
local present, true_zen = pcall(require, "true-zen")

if not present then
  return
end

true_zen.setup()
