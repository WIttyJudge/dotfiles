-- Useful
vim.cmd([[
command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)'
command! Filetype execute 'lua print(vim.bo.filetype)'
]])

-- execute goimports linter
vim.cmd([[
command! Goimports :lua require('custom.go.format').goimports(1000)
]])

-- Git
vim.cmd([[
command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame
]])
