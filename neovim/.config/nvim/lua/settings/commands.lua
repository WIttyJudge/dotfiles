vim.cmd([[
command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)'
]])

-- Code execution
vim.cmd([[
command! RubyRun :call mappings#RunWith("ruby")
command! GoRun :call mappings#RunWith("go run")
command! JsRun :call mappings#RunWith("node")
]])

-- Linting
vim.cmd([[
command! Goimports :lua require('custom.go.format').goimports(1000)
" command! FormatterEnable :lua require('toggle-formatting.toggle-formatting').setup({enable: true})
" command! FormatterDisable :lua require('toggle-formatting.toggle-formatting').setup({enable: false})
]])

-- Git
vim.cmd([[
command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame
]])
