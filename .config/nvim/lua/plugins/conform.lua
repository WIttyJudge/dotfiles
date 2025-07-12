return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<Leader>cf", "<Cmd>Format<CR>", desc = "Format" },
  },
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      -- go = { "goimports", "gofumpt" },
      go = { "goimports" },
      -- rust = { "rustfmt" },
      lua = { "stylua" },
      sh = { "shfmt" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      sql = { "sqlfluff" },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
