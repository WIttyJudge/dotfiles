-- https://github.com/Wansmer/treesj

local present, treesj = pcall(require, "treesj")

if not present then
  return
end

treesj.setup()
