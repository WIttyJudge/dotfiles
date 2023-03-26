local utils = require "internal.utils"

local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- ##########################
-- #    General Settings    #
-- ##########################

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

autocmd("BufReadPost", {
  group = augroup "general_settings",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Go to last location when opening a buffer",
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = augroup "general_settings",
  desc = "Spell check",
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
  group = augroup "general_settings",
  desc = "Highlight yanked text",
})

-- autocmd({ "InsertLeave", "TextChanged" }, {
--     pattern = { "*" },
--     command = "silent! wall",
--     nested = true,
--     group = augroup("general_settings"),
--     desc = "Auto save buffer",
-- })

autocmd("FileType", {
  pattern = "gitcommit",
  command = "startinsert",
  group = augroup "general_settings",
  desc = "Trigger insert mode",
})

autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
  group = augroup "general_settings",
  desc = "Don't auto commenting new lines",
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup "general_settings",
  command = "checktime",
})

-- #################
-- #    Plugins    #
-- #################

autocmd({ "FileType" }, {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
  end,
  group = augroup "plugins",
  desc = "vim-dadbod-completion-plugin",
})

autocmd({ "BufWritePost" }, {
  pattern = { "*.sum", "*.mod" },
  command = ":silent :GoModTidy",
  group = augroup "plugins",
  desc = "Golang plugins",
})

-- ################
-- #    Linter    #
-- ################

autocmd({ "BufWritePre" }, {
  pattern = { "*.go" },
  callback = function()
    require("go.format").goimport()
  end,
  group = augroup "linter",
})

autocmd({ "BufWritePre" }, {
  pattern = { "*.rs" },
  command = "FormatWrite",
  group = augroup "linter",
})

-- ######################
-- #    Auto Compile    #
-- ######################

-- Compile suckless-tools on save
autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwmblocks/config.h",
  command = "!cd ~/suckless-tools/dwmblocks; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }",
  group = augroup "auto_compile",
  desc = "Dwmblocks suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dwm/config.h",
  command = "!cd ~/suckless-tools/dwm; sudo make clean install",
  group = augroup "auto_compile",
  desc = "DWM suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = utils.get_homedir() .. "/suckless-tools/dmenu/config.h",
  command = "!cd ~/suckless-tools/dmenu; sudo make clean install",
  group = augroup "auto_compile",
  desc = "Dmenu suckless utils",
})

autocmd({ "BufWritePost" }, {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
  group = augroup "auto_compile",
})

autocmd({ "BufWritePost" }, {
  pattern = ".Xresources",
  command = "!xrdb %",
  group = augroup "auto_compile",
})

autocmd({ "BufWritePost" }, {
  pattern = "bspwmrc",
  command = "!bspc wm -r",
  group = augroup "auto_compile",
})
