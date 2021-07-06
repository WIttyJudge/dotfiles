" Include all plugins
source $HOME/.config/nvim/general/plugins.vim

" Settings for neovim
source $HOME/.config/nvim/general/settings.vim

" shortcuts
source $HOME/.config/nvim/general/mappings.vim

" theme (colorschema)
source $HOME/.config/nvim/general/colors.vim

" autocmd
source $HOME/.config/nvim/general/autocmds.vim

" Custom command-line command
source $HOME/.config/nvim/general/commands.vim

" Load lua config files
lua <<EOF
require('lsp')
require('plugins')

require('nvim-compe')
EOF

