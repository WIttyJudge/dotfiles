return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    format_on_save = function()
      -- Disable with a global variable
      if not vim.g.autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters_by_ft = {
      -- ruby = { "rubocop" },
      -- go = { "goimports", "gofumpt" },
      go = { "goimports" },
      lua = { "stylua" },
      sh = { "shfmt" },
      json = { "prettier" },
      yaml = { "prettier" },
      toml = { "taplo" },
      markdown = { "prettier" },
      sql = { "sqlfluff" },
      dockerfile = { "dockerfmt" },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)
    conform.formatters.shfmt = {
      prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
    }

    vim.api.nvim_create_user_command("ToggleAutoformat", function()
      vim.notify("Toggling autoformat", vim.log.levels.INFO, { title = "conform.nvim", timeout = 2000 })
      vim.g.autoformat = vim.g.autoformat == false and true or false
    end, { desc = "Toggling autoformat" })
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
