-- https://github.com/vim-test/vim-test
-- local present, vim_test = pcall(require, "vim-test")

-- if not present then
--   return
-- end

vim.cmd([[
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let test#strategy = "neovim"
]])
