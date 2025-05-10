-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  enabled = false,
  dependencies = {
    -- autopairing of (){}[] etc
    {
      "windwp/nvim-autopairs",
      config = function()
        require("plugins.configs.nvim-autopairs")
      end,
    },

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  config = function()
    require("plugins.configs.cmp")
  end,
}
