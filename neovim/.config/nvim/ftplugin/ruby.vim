" settings
" Converts tabs to spaces, one tab is two spaces
setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" RSpec
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Run ruby code
nmap <Leader>e :call mappings#RunWith("ruby")<CR>

