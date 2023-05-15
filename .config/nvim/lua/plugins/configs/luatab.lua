-- https://github.com/alvarosevilla95/luatab.nvim
local luatab = require("luatab")

local config = {
  devicon = require("luatab").helpers.devicon,
  title = require("luatab").helpers.title,
  modified = function()
    return ""
  end,
  windowCount = require("luatab").helpers.windowCount,
}

luatab.setup(config)
