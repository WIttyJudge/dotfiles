-- https://github.com/alvarosevilla95/luatab.nvim
local present, luatab = pcall(require, "luatab")

if not present then
  return
end

local config = {
  devicon = require("luatab").helpers.devicon,
  title = require("luatab").helpers.title,
  modified = function()
    return ""
  end,
  windowCount = require("luatab").helpers.windowCount,
}

luatab.setup(config)
