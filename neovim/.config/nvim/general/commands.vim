command! LspFormat execute 'lua vim.lsp.buf.formatting()'

" Code execution
command! RubyRun :call mappings#RunWith("ruby")
command! GoRun :call mappings#RunWith("go run")
command! JsRun :call mappings#RunWith("node")
