" hightline like an error if more then 80 lines of code in one line.
" match ErrorMsg '\%>80v.\+'

autocmd FileType fern setlocal signcolumn=no

" Restore cursor to where it was when the file was closed
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" autocmd BufWritePre * %s/\s\+$//e       " remove  trailing whitespace on save

" Autocompile suckless tools
augroup SucklessTools
  autocmd!
  
  autocmd BufWritePost ~/suckless-tools/dwmblocks/config.h
        \ !cd ~/suckless-tools/dwmblocks/;
        \ sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

  autocmd BufWritePost ~/suckless-tools/dwm/config.h
        \ !cd ~/suckless-tools/dwm/;
        \ sudo make install

  autocmd BufWritePost ~/suckless-tools/dmenu/config.h
        \ !cd ~/suckless-tools/dmenu/;
        \ sudo make install
augroup END

" autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
" autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
" autocmd BufWritePre *.go :silent! lua require('custom.go.format').goimports(1000)

" execute goimports linter
autocmd BufWritePre *.go :silent! :Goimport
" autocmd BufWritePre *.go :silent! :Gofmt
 
" autocmd BufWritePre (InsertLeave?) *.go <buffer> :silent! lua vim.lsp.buf.formatting_sync(nil,500)

