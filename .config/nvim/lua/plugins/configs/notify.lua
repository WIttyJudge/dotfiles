-- https://github.com/rcarriga/nvim-notify
local present, notify = pcall(require, "notify")

if not present then
  return
end

local icons = require "internal.icons"

local config = {
  -- Animation style (see below for details)
  stages = "fade",

  -- Default timeout for notifications
  timeout = 2000,

  -- Icons for the different levels
  icons = {
    ERROR = icons.error,
    WARN = icons.warn,
    INFO = icons.info,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },
}

notify.setup(config)
