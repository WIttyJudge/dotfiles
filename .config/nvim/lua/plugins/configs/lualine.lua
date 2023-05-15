-- https://github.com/hoob3rt/lualine.nvim
local lualine = require("lualine")

local internal_condition = require("internal.conditions")
local icons = require("internal.icons")

-- gruvbox-material
local colors = {
  bg = "#282828",
  fg = "#d4be98",
  red = "#ea6962",
  orange = "#e78a4e",
  yellow = "#d8a657",
  cyan = "#89b482",
  darkblue = "#45707a",
  green = "#a9b665",
  agua = "#89b482",
  blue = "#7daea3",
  purple = "#d3869b",
}

local vi_mode_text = {
  n = "NORMAL",
  i = "INSERT",
  V = "VISUAL",
  [""] = "VISUAL",
  v = "VISUAL",
  c = "COMMAND",
  ["r?"] = ":CONFIRM",
  rm = "--MORE",
  R = "REPLACE",
  Rv = "VIRTUAL",
  s = "SELECT",
  S = "SELECT",
  ["r"] = "HIT-ENTER",
  [""] = "SELECT",
  t = "TERMINAL",
  ["!"] = "SHELL",
}

local vi_mode_color = {
  n = colors.yellow,
  i = colors.green,
  v = colors.blue,
  [""] = colors.blue,
  V = colors.blue,
  c = colors.purple,
  no = colors.red,
  s = colors.orange,
  S = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.red,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.red,
}

-- set color for disabled_filetypes statusline
vim.api.nvim_command("hi StatusLine guibg=" .. colors.bg)
vim.api.nvim_command("hi StatusLineNC guibg=" .. colors.bg)

local config = {
  options = {
    globalstatus = true,
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    disabled_filetypes = {
      "NvimTree",
      "fern",
      "packer",
      "startify",
      "fugitive",
      "fugitiveblame",
      "gitcommit",
      "help",
      "dbui",
      "dbout",
      "Trouble",
      "undotree",
      "alpha",
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    vim.api.nvim_command("hi! LualineMode gui=bold guibg=" .. vi_mode_color[vim.fn.mode()] .. " guifg=" .. colors.bg)

    return vi_mode_text[vim.fn.mode()]
  end,
  color = "LualineMode",
})

ins_left({
  -- File Name
  function()
    local f_name = vim.fn.expand("%:t")

    if vim.bo.readonly then
      f_name = f_name .. " " .. icons.ui.Lock
    end

    if vim.bo.modified then
      f_name = f_name .. " " .. icons.ui.Unsaved
    end

    return f_name
  end,
  condition = internal_condition.buffer_not_empty,
  color = { fg = colors.fg, gui = "bold" },
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.Error .. " ",
    warn = icons.diagnostics.Warn .. " ",
    info = icons.diagnostics.Info .. " ",
  },
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.blue,
})

ins_left({
  function()
    return require("nvim-navic").get_location()
  end,
  cond = function()
    return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
  end,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_left {function() return '%=' end}

ins_right({
  "diff",
  symbols = {
    added = icons.git.Add .. " ",
    modified = icons.git.Modify .. " ",
    removed = icons.git.Remove .. " ",
  },
  color_added = colors.green,
  color_modified = colors.blue,
  color_removed = colors.red,
  condition = internal_condition.hide_in_width,
})

ins_right({
  "branch",
  icon = icons.git.Branch,
  condition = internal_condition.check_git_workspace,
  color = { fg = colors.yellow, gui = "bold" },
})

ins_right({ "filetype" })

ins_right({ "location" })

ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

-- Now don't forget to initialize lualine
lualine.setup(config)
