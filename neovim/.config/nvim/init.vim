" Include all plugins"
source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/general/settings.vim

source $HOME/.config/nvim/plug-config/fzf.vim

" Includes all available shortcuts"
source $HOME/.config/nvim/keymaps.vim

colorscheme darcula

" How can I open a NERDTree automatically when vim starts up if no files were specified"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
