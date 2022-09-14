-- https://github.com/chaoren/vim-wordmotion
-- local present, vim_wordmotion = pcall(require, "vim-wordmotion")

-- if not present then
--   return
-- end

vim.g.wordmotion_nomap = 1

vim.cmd([[
nmap w          <Plug>WordMotion_w
nmap b          <Plug>WordMotion_b
]])
