-- https://github.com/mbbill/undotree
-- local present, undotree = pcall(require, "undotree")

-- if not present then
--   return
-- end

vim.g.undotree_WindowLayout = 4
vim.g.undotree_SetFocusWhenToggle = 1

vim.g.undotree_DiffpanelHeight = 10
vim.g.undotree_SplitWidth = 40

vim.cmd([[
function g:Undotree_CustomMap()
  map <buffer> <c-j> J
  map <buffer> <c-k> K
endfunction
]])

