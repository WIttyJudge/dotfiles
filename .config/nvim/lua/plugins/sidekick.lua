-- https://github.com/folke/sidekick.nvim
return {
  "folke/sidekick.nvim",
  opts = {
    nes = {
      enabled = false,
    },
    -- add any options here
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
    prompts = {
      refactor = "Please refactor {this} to be more maintainable",
    },
  },
  keys = require("core.plugin_mappings").sidekick,
}
