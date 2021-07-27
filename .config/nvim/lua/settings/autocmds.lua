local cmd = vim.cmd

-- Highlight like an error if more then 80 lines of code in one line.
-- match ErrorMsg '\%>80v.\+'
cmd([[
autocmd FileType fern setlocal signcolumn=no
]])

-- Highlight yanked text
cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
]])

-- Restore cursor to where it was when the file was closed
cmd([[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- remove  trailing whitespace on save
-- autocmd BufWritePre * %s/\s\+$//e

-- Autocompile suckless tools
-- cmd([[
-- augroup SucklessTools
--   autocmd!
--   
--   autocmd BufWritePost ~/suckless-tools/dwmblocks/config.h
--         \ !cd ~/suckless-tools/dwmblocks/;
--         \ sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
-- 
--   autocmd BufWritePost ~/suckless-tools/dwm/config.h
--         \ !cd ~/suckless-tools/dwm/;
--         \ sudo make install
-- 
--   autocmd BufWritePost ~/suckless-tools/dmenu/config.h
--         \ !cd ~/suckless-tools/dmenu/;
--         \ sudo make install
-- augroup END
-- ]])

-- autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
-- autocmd BufWritePre *.go :silent! lua require('custom.go.format').goimports(1000)

-- execute goimports linter

cmd([[
autocmd BufWritePre *.go :silent! :Goimport
]])

-- autocmd BufWritePre *.go :silent! :Gofmt
 
-- autocmd BufWritePre (InsertLeave?) *.go <buffer> :silent! lua vim.lsp.buf.formatting_sync(nil,500)

