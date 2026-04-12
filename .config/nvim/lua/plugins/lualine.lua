return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/sidekick.nvim",
  },
  config = function()
    local icons = require("internal.icons")
    local diff = {
      "diff",
      symbols = {
        added = icons.git.Add .. " ",
        modified = icons.git.Modify .. " ",
        removed = icons.git.Remove .. " ",
      },
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = icons.diagnostics.Error .. " ",
        warn = icons.diagnostics.Warn .. " ",
        info = icons.diagnostics.Info .. " ",
      },
    }

    local nvim_navic = {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
      end,
    }

    local branch = {
      "branch",
      icon = icons.git.Branch,
    }

    local config = {
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", diff, diagnostics },
        lualine_c = {
          {
            function()
              return " "
            end,
            color = function()
              local status = require("sidekick.status").get()
              if status then
                return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
              end
            end,
            cond = function()
              local status = require("sidekick.status")
              return status.get() ~= nil
            end,
          },

          nvim_navic,
        },
        lualine_x = {
          {
            function()
              local status = require("sidekick.status").cli()
              return " " .. (#status > 1 and #status or "")
            end,
            cond = function()
              return #require("sidekick.status").cli() > 0
            end,
            color = function()
              return "Special"
            end,
          },

          branch,
          "filetype",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
    }

    require("lualine").setup(config)
  end,
}
