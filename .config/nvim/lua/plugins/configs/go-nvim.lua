-- https://github.com/ray-x/go.nvim
local present, go = pcall(require, "go")

if not present then
  return
end

go.setup()
