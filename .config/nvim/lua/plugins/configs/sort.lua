-- https://github.com/sQVe/sort.nvim
local present, sort = pcall(require, "sort")

if not present then
  return
end

sort.setup()
