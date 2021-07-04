" Since we use Neovim's builtin LSP
let g:ale_disable_lsp = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" If you want to select certain linters.
" let g:ale_linters = {
"       \ 'ruby': ['rubocop'],
"       \ 'go': ['gofmt'],
"       \ 'html': ['prettier'],
"       \ 'svelte': ['prettier'],
"       \ }

" Run linter when I open a file
let g:ale_lint_on_enter = 1

" Run linter only when I save a file
let g:ale_lint_on_save = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Define automaticaly run ALEFix command on save.
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'html': ['prettier'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'svelte': ['prettier'],
      \ }
let g:ale_fix_on_save = 0

" Signs
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

