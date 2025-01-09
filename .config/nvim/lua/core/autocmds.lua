local utils = require("internal.utils")

local autocmd = vim.api.nvim_create_autocmd

--  +----------------------------------------------------------+
--  |                     General Settings                     |
--  +----------------------------------------------------------+

local general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })

autocmd("BufReadPost", {
  group = general_settings,
  pattern = "*",
  command = 'silent! normal! g`"zv',
  desc = "Restore cursor to where it was when the file was closed",
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = general_settings,
  desc = "Highlight yanked text",
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general_settings,
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
  desc = "Check if we need to reload the file when it changed"
})


-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = general_settings,
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
-- autocmd({ "InsertLeave", "TextChanged" }, {
--     pattern = { "*" },
--     command = "silent! wall",
--     nested = true,
--     group = general_settings,
--     desc = "Auto save buffer",
-- })

autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general_settings,
  desc = "Don't auto commenting new lines",
})

--  +----------------------------------------------------------+
--  |                         Plugins                          |
--  +----------------------------------------------------------+

local plugins = vim.api.nvim_create_augroup("_plugins", { clear = true })

autocmd({ "BufWritePost" }, {
  pattern = { "*.sum", "*.mod" },
  command = ":silent :GoModTidy",
  group = plugins,
  desc = "Golang plugins",
})

--  +----------------------------------------------------------+
--  |                          Linter                          |
--  +----------------------------------------------------------+

local linter = vim.api.nvim_create_augroup("_linter", { clear = true })

autocmd({ "BufWritePost" }, {
  pattern = { "*.go", "*.rs" },
  command = "Format",
  group = linter,
})

--  +----------------------------------------------------------+
--  |                       Auto Compile                       |
--  +----------------------------------------------------------+

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
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
  group = auto_compile,
  desc = "Reload tmux",
})

autocmd({ "BufWritePost" }, {
  pattern = ".Xresources",
  command = "!xrdb % ; kill -USR1 $(pidof st)",
  group = auto_compile,
  desc = "Reload .Xresources",
})

autocmd({ "BufWritePost" }, {
  pattern = "bspwmrc",
  command = "!bspc wm -r",
  group = auto_compile,
  desc = "Reload bspwm",
})
