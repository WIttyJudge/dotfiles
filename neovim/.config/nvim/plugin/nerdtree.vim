let NERDTreeShowHidden=1

" Dont show this folders in nerdtree
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" automatically close NerdTree when you open a file
" let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

" Size of the window
let g:NERDTreeWinSize = 33

" Open top-folder without cd into it
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" IF you want to remove array symbols
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''

" jistr/vim-nerdtree-tabs
let g:nerdtree_tabs_focus_on_files = 1
" Exit Vim if NERDTree is the only window left.
let g:nerdtree_tabs_autoclose = 1

" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'+',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

