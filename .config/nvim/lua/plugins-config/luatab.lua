-- https://github.com/alvarosevilla95/luatab.nvim

require('luatab').setup{
  devicon = require('luatab').helpers.devicon,
  title = require('luatab').helpers.title,
  modified = function() return '' end,
  windowCount = require('luatab').helpers.windowCount,
  separator = function() return '' end
}
