" if you want to select certain linters.
let g:ale_linters = {
      \ 'ruby': ['rubocop', 'rails_best_practices'],
      \ 'bash': ['shellcheck'],
      \ 'c': ['clang-format'],
      \ 'rust': ['rustfmt'],
      \ }
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" Define automaticaly run ALEFix command on save.
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'c': ['clang-format'],
      \ 'rust': ['rustfmt'],
      \}
let g:ale_fix_on_save = 0

" Signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

