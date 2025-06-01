-- https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      flash = true,
      aerial = true,
      diffview = true,
      blink_cmp = true,
      dadbod_ui = true,
      lsp_trouble = true,
      grug_far = true,
      markdown = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotree = true,
      semantic_tokens = true,
      gitsigns = true,
      illuminate = true,
      mason = true,
      snacks = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
