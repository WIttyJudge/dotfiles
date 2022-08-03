-- https://github.com/mhartington/formatter.nvim
local present, formatter = pcall(require, "formatter")

if not present then
  return
end

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

local function goimports()
  return {
    exe = "goimports",
    args = { "-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    stdin = false,
  }
end

local function gofumpt()
  return { exe = "gofumpt", stdin = true }
end

local function shfmt()
  local shiftwidth = vim.opt.shiftwidth:get()
  local expandtab = vim.opt.expandtab:get()

  if not expandtab then
    shiftwidth = 0
  end

  return { exe = "shfmt", args = { "-i", shiftwidth }, stdin = true }
end

local function prettier()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    stdin = true,
  }
end

formatter.setup {
  logging = false,
  filetype = {
    ruby = {
      rubocop,
      --require('formatter.filetypes.ruby').rubocop,
    },
    rust = { rustfmt },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    sh = { shfmt },

    json = { require("formatter.filetypes.json").prettier },
    yaml = { require("formatter.filetypes.json").prettier },
    markdown = { prettier },
  },
}
