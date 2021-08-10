" Tabs and a tab width of 4
setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" Read more about flags
" https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

" autocomplete
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1

" Disable default mappings
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_code_completion_enabled = 0

let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1
