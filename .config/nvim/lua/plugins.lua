-- https://github.com/savq/paq-nvim

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require('paq') {
  "savq/paq-nvim";

  -- LSP
  "neovim/nvim-lspconfig";
  "onsails/lspkind-nvim";
  "glepnir/lspsaga.nvim";
  "folke/trouble.nvim";
  "liuchengxu/vista.vim";

  -- LSP installer
  "williamboman/nvim-lsp-installer";

  -- Autocomplete
  -- "hrsh7th/nvim-compe";
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-vsnip";
  "hrsh7th/vim-vsnip";
  "hrsh7th/cmp-path";

  "ray-x/lsp_signature.nvim";
  -- "jiangmiao/auto-pairs";
  "rstacruz/vim-closer";

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" };
  "p00f/nvim-ts-rainbow";
  "nvim-treesitter/nvim-treesitter-refactor";
  "windwp/nvim-ts-autotag";

  -- Move && Scroll && Replace
  "wellle/targets.vim";
  { "mg979/vim-visual-multi", branch = "master"};
  "blackcauldron7/surround.nvim";
  "AndrewRadev/splitjoin.vim";
  "kevinhwang91/nvim-hlslens";
  "karb94/neoscroll.nvim";
  "phaazon/hop.nvim";
  "chaoren/vim-wordmotion";

  -- Syntax
  "folke/todo-comments.nvim";
  "norcalli/nvim-colorizer.lua";
  "Yggdroot/indentLine";

  -- Git
  "tpope/vim-fugitive";
  "lewis6991/gitsigns.nvim";
  "junegunn/gv.vim";
  -- "sindrets/diffview.nvim";

  -- Icons
  "kyazdani42/nvim-web-devicons";
  "lambdalisue/glyph-palette.vim";

  -- Linter
  "mhartington/formatter.nvim";

  -- Colorscheme
  "sainnhe/gruvbox-material";
  -- "WIttyJudge/gruvbox-material.nvim";

  -- Looking for files, etc..
  "nvim-lua/popup.nvim";
  "nvim-lua/plenary.nvim";
  "nvim-telescope/telescope.nvim";
  "nvim-telescope/telescope-fzy-native.nvim";

  -- Explorer
  "kyazdani42/nvim-tree.lua";

  -- Comment out code
  "terrortylor/nvim-comment";

  -- Statusline and bufferline
  "hoob3rt/lualine.nvim";

  -- Fancy startup screen
  "mhinz/vim-startify";

  -- Changes working directory
  "airblade/vim-rooter";

  -- Ruby
  "thoughtbot/vim-rspec";
  "tpope/vim-rvm";

  -- Golang
  -- "ray-x/go.nvim";
  "fatih/vim-go";

  -- Useful functions
  "lambdalisue/suda.vim";
 
  -- Undo history visualizer
  "mbbill/undotree";

  -- Profiling
  "tweekmonster/startuptime.vim";

  -- Autosave
  "Pocco81/AutoSave.nvim";

  -- Run tests
  "vim-test/vim-test";

  -- Improve startup time
  "lewis6991/impatient.nvim";

  -- The interactive scratchpad.
  "metakirby5/codi.vim";

  -- Debug
  -- "mfussenegger/nvim-dap";
  -- "Pocco81/DAPInstall.nvim";

  -- Database
  "tpope/vim-dadbod";
  "kristijanhusak/vim-dadbod-ui";
}
