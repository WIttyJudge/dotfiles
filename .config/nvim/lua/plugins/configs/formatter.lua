-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")

local function rubocop()
  return {
    exe = "rubocop", -- might prepend `bundle exec `
    args = {
      "--auto-correct",
      "--stdin",
      "%:p",
      "2>/dev/null",
      "|",
      "awk 'f; /^====================$/{f=1}'",
    },
    stdin = true,
  }
end

formatter.setup  {
  logging = false,
  filetype = {
    ruby = {
      rubocop,
      --require('formatter.filetypes.ruby').rubocop,
    },
    -- rust = { rustfmt },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    go = {
      require("formatter.filetypes.go").goimports,
    },
    sh = {
      require("formatter.filetypes.sh").shfmt,
    },
    json = { require("formatter.filetypes.json").prettier },
    yaml = { require("formatter.filetypes.yaml").prettier },
    markdown = { require("formatter.filetypes.markdown").prettier },
  },
}
