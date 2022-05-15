-- https://github.com/hrsh7th/vim-vsnip
local present, vim_vsnip = pcall(require, "vim-vsnip")

if not present then
  return
end

vim.cmd([[
let g:vsnip_snippet_dir = '~/.config/nvim/.vsnip'

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.eruby = ['html']
]])
