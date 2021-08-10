-- print current directory as a banner startify header
local cwd = vim.fn.split(vim.fn.getcwd(), '/')
local banner = vim.fn.system("figlet "..cwd[#cwd])
local header = vim.fn['startify#pad'](vim.fn.split(banner, '\n'))
vim.g.startify_custom_header = header

-- vim.api.nvim_command([[ hi StartifyFooter ctermfg=123 ]])
-- vim.g.startify_custom_footer = {
--   '          ▄▄▄',
--   '       ▄█████▄▄',
--   '      ███▀▀▀▀▀▀▀▀',
--   '      ███▄   ▀ ▀▀',
--   '       ▄  █████▄ █▄',
--   '      ▀▀▄▄   ▄▄▄▀██▀',
--   '       ██▀▀▀██▀  ▀',
--   '       ▀▀▀▀ ▀▀▀▀',
-- }


-- If you want numbers to start at 1 instead of 0, you could use this:
vim.cmd([[
  let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
]])

vim.g.startify_files_number = 5

-- Don't change to directory when selecting a file
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1

vim.g.webdevicons_enable_startify = 1

vim.g.startify_relative_path = 1

vim.g.startify_use_env = 1

-- Custom startup list, only show MRU from current directory/project

vim.g.startify_lists = { 
  { type = 'dir', header = {  "    Recently edited files in "..vim.fn.getcwd()..":" } },
  { type = 'bookmarks', header = { "    Bookmarks" } },
  { type = 'commands', header = { "    Commands" } },
  { type = 'sessions', header = { "   Sessions" } }
}

vim.g.startify_bookmarks = {
    { i = '~/.config/nvim/init.vim' },
    { p = '~/.config/nvim/lua/plugins.lua' },
    { m = '~/.config/nvim/lua/settings/mappings.lua' },
}

vim.g.startify_commands = {
  { up = { 'Update Plugins', ':PaqUpdate' }},
  { uc = { 'Clean Plugin Manager', ':PaqClean' } },
  { ch = { 'Check Health', ':checkhealth' } },
  -- { st = { 'Start Profiling', ':StartupTime ~/.config/nvim/init.lua' } },
}

