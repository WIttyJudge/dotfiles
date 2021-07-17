-- print current directory as a banner startify header
local cwd = vim.fn.split(vim.fn.getcwd(), '/')
local banner = vim.fn.system("figlet "..cwd[#cwd])
local header = vim.fn['startify#pad'](vim.fn.split(banner, '\n'))
vim.g.startify_custom_header = header

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
  { type = 'commands', header = { "    Commands" } }
}

vim.g.startify_bookmarks = {
    { i = '~/.config/nvim/init.vim' },
    { p = '~/.config/nvim/general/plugins.vim' },
    { m = '~/.config/nvim/general/mappings.vim' },
}

vim.g.startify_commands = {
  { up = { 'Update Plugins', ':PlugUpdate' }},
  { ug = { 'Upgrade Plugin Manager', ':PlugUpgrade' } },
  { uc = { 'Clean Plugin Manager', ':PlugClean' } },
  { ch = { 'Check Health', ':checkhealth' } },
  { st = { 'Start Profiling', 'StartupTime ~/.config/nvim/init.vim' } },
}

