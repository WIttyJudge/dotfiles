command! LspFormat execute 'lua vim.lsp.buf.formatting_sync(nil, 1000)'

" Code execution
command! RubyRun :call mappings#RunWith("ruby")
command! GoRun :call mappings#RunWith("go run")
command! JsRun :call mappings#RunWith("node")

" Linting
command! Goimports :lua require('custom.go.format').goimports(1000)
