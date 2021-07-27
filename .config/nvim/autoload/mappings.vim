" function for running file code in the terminal
function mappings#RunWith (command)
  execute "w"
  execute "!" . a:command . " " . expand("%")
endfunction
