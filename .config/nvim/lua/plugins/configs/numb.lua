-- https://github.com/nacro90/numb.nvim
local present, numb = pcall(require, "numb")

if not present then
  return
end

numb.setup()
