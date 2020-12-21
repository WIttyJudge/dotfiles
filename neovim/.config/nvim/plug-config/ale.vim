" if you want to select certain linters.
let g:ale_linters = {
      \ 'ruby': ['rubocop', 'rails_best_practices'],
      \ 'bash': ['shellcheck'],
      \ }

" Define automaticaly run ALEFix command on save.
let g:ale_fixers = {
      \    'ruby': ['rubocop'],
      \}
let g:ale_fix_on_save = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" Signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" I add this to plug-config/lightline.vim
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
