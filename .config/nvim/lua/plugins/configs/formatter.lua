-- https://github.com/mhartington/formatter.nvim
local present, formatter = pcall(require, "formatter")

if not present then
  return
end

local util = require "formatter.util"

local function rubocop()
  return {
    exe = 'rubocop', -- might prepend `bundle exec `
    args = {
      '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|',
      "awk 'f; /^====================$/{f=1}'"
    },
    stdin = true
  }
end

local function rustfmt()
  return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
end

local function goimports()
  return {
    exe = "goimports",
    args = {"-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = false
  }
end

local function gofumpt()
  return { exe = "gofumpt", stdin = true }
end

local function stylua()
  return {
    exe = "stylua",
    args = {
      "--search-parent-directories",
      "--stdin-filepath",
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
      "--",
      "-",
    },
    stdin = true,
  }
end

local function shfmt()
  return { exe = "shfmt", args = { "-i", 2 }, stdin = true }
end

local function prettier()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
    stdin = true
  }
end

formatter.setup {
  logging = false,
  filetype = {
    ruby = { 
      require('formatter.filetypes.ruby').rubocop,
    },
    rust = { rustfmt },
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    sh = { shfmt },

    html = { prettier },
    css = { prettier },
    scss = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    vue = { prettier },

    json = { prettier },
    yaml = { prettier },
    markdown = { prettier }
  }
}
