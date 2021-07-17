" Include all plugins

" lua require('my_plugins')

source $HOME/.config/nvim/settings/plugins.vim

" Settings for neovim
source $HOME/.config/nvim/settings/options.vim

" shortcuts
source $HOME/.config/nvim/settings/mappings.vim

" theme (colorschema)
" source $HOME/.config/nvim/settings/colors.vim
lua require('settings/colors')

" autocmd
source $HOME/.config/nvim/settings/autocmds.vim

" Custom command-line command
source $HOME/.config/nvim/settings/commands.vim

" Load lua config files
lua <<EOF
require('lsp')
require('plugins')

require('nvim-compe')
EOF

