vim.cmd([[
command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)'
]])

-- Code execution
vim.cmd([[
command! GoRun :call mappings#RunWith("go run")
command! JsRun :call mappings#RunWith("node")

command! TsRun :call mappings#RunWith("npx ts-node")
]])

-- Linting
vim.cmd([[
command! Goimports :lua require('custom.go.format').goimports(1000)
]])

-- Git
vim.cmd([[
command! GitBlameByLineToggle :Gitsigns toggle_current_line_blame
]])
