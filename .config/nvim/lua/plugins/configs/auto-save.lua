-- https://github.com/Pocco81/auto-save.nvim

local present, auto_save = pcall(require, "auto-save")

if not present then
  return
end

local config = {
  execution_message = {
    message = function() -- message to print on save
      return ("")
    end,
  },
}

auto_save.setup(config)
