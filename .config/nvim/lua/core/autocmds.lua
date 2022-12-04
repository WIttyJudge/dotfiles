local utils = require "internal/utils"

local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

local general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })

autocmd("BufReadPost", {
  callback = function()
    if not vim.fn.expand("%:p"):match ".git" and vim.fn.line "'\"" > 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.cmd "normal! g'\""
      vim.cmd "normal zz"
    end
  end,
  desc = "Restore cursor to where it was when the file was closed",
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = general_settings,
  desc = "Spell check",
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
  group = general_settings,
  desc = "Highlight yanked text",
})

autocmd({ "BufEnter", "FocusGained" }, {
  command = "silent! checktime",
  group = general_settings,
  desc = "Reload modified changes automatically (autoread)",
})

autocmd("FileType", {
  pattern = "gitcommit",
  command = "startinsert",
  group = general_settings,
  desc = "Trigger insert mode",
})

autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
  group = general_settings,
  desc = "Don't auto commenting new lines",
})

-- Plugins
-- =====================================

local plugins = vim.api.nvim_create_augroup("_plugins", { clear = true })

autocmd({ "FileType" }, {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
  end,
  group = plugins,
  desc = "vim-dadbod-completion-plugin",
})

autocmd({ "BufWritePost" }, {
  pattern = { "*.sum", "*.mod" },
  command = ":silent :GoModTidy",
  group = plugins,
  desc = "Golang plugins",
})

-- Linter
-- =====================================

local linter = vim.api.nvim_create_augroup("_linter", { clear = true })

autocmd({ "BufWritePre" }, {
  pattern = { "*.go" },
  callback = function()
    require("go.format").goimport()
  end,
  group = linter,
})

autocmd({ "BufWritePre" }, {
  pattern = { "*.rs" },
  command = "FormatWrite",
  group = linter,
})

-- Auto Compile
-- =====================================

local auto_compile = vim.api.nvim_create_augroup("_auto_compile", { clear = true })

-- Compile suckless-tools on save
autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwmblocks/config.h",
  command = "!cd ~/suckless-tools/dwmblocks; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }",
  group = auto_compile,
  desc = "Dwmblocks suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwm/config.h",
  command = "!cd ~/suckless-tools/dwm; sudo make clean install",
  group = auto_compile,
  desc = "DWM suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dmenu/config.h",
  command = "!cd ~/suckless-tools/dmenu; sudo make clean install",
  group = auto_compile,
  desc = "Dmenu suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = { "tmux.conf", ".tmux.conf" },
  command = "!tmux source-file %",
  group = auto_compile,
})

autocmd({ "BufWritePost" }, {
  pattern = ".Xresources",
  command = "!xrdb %",
  group = auto_compile,
})

return M
