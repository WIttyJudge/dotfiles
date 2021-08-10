" Converts tabs to spaces, one tab is two spaces
setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

command! RubyRun :call mappings#RunWith("ruby")

" RSpec
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
