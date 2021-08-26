vim.cmd([[
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let test#strategy = "neovim"
]])
