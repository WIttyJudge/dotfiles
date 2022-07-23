-- https://github.com/kdheepak/lazygit.nvim
local present, hop = pcall(require, "lazygit")

if not present then
  return
end
