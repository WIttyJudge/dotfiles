if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end

vim.g.gruvbox_material_enable_italic_comments = true
vim.g.gruvbox_material_sign_column_background = 'none'
vim.g.gruvbox_material_diagnostic_text_highlight = 0
vim.g.gruvbox_material_diagnostic_virtual_text = 'grey'
vim.opt.background = 'light'

-- require('wittyjudge/gruvbox-material').setup()
-- require('gruvbox-material').setup()

vim.cmd('colorscheme gruvbox-material')

-- hi! Normal ctermbg=NONE
-- hi! NonText ctermbg=NONE
-- 
-- autocmd SourcePost * highlight Normal ctermbg=NONE guibg=NONE
--       	\ |    highlight LineNr ctermbg=NONE guibg=NONE
--

-- vim.cmd([[
--   highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
-- ]])
