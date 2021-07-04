" hightline like an error if more then 80 lines of code in one line.
" match ErrorMsg '\%>80v.\+'

autocmd FileType fern setlocal signcolumn=no

" Restore cursor to where it was when the file was closed
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" autocmd BufWritePre * %s/\s\+$//e       " remove  trailing whitespace on save

" Autocompile suckless tools
autocmd BufWritePost ~/suckless-tools/dwmblocks/config.h
      \ !cd ~/suckless-tools/dwmblocks/;
      \ sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

autocmd BufWritePost ~/suckless-tools/dwm/config.h
      \ !cd ~/suckless-tools/dwm/;
      \ sudo make install

autocmd BufWritePost ~/suckless-tools/dmenu/config.h
      \ !cd ~/suckless-tools/dmenu/;
      \ sudo make install

autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
