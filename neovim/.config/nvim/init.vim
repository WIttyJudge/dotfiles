" Include all plugins
source $HOME/.config/nvim/general/plugins.vim

" Settings for neovim
source $HOME/.config/nvim/general/settings.vim

" shortcuts
source $HOME/.config/nvim/general/mappings.vim

" neovim theme (colorschema)
source $HOME/.config/nvim/general/appearance.vim

" Load lua config files
lua <<EOF
require('lsp')
require('plugins')

require('nvim-compe')
EOF

