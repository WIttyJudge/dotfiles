-- https://github.com/Pocco81/AutoSave.nvim
local present, autosave = pcall(require, "autosave")

if not present then
  return
end

local config = {
  enabled = true,
  execution_message = "AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S",
  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 1,
  debounce_delay = 0,
}

autosave.setup(config)
