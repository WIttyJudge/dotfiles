-- https://github.com/mistweaverco/kulala.nvim
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = require("core.mappings").kulala,
  opts = {
    ui = {
      -- 800 kb
      max_response_size = 819200,
    },
  },
}
