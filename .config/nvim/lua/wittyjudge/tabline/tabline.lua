-- Custom simple tabline

local M = {}
local fn = vim.fn

local has_devicons, devicons = pcall(require, 'nvim-web-devicons')

_TABLINE_NVIM_CFG = {
    show_index = true,
    show_modify = true,
    modify_icon = "+",
    no_name = 'No Name'
}

local function tabline(options)
  local s = ''
  for index = 1, fn.tabpagenr('$') do
    local winnr = fn.tabpagewinnr(index)
    local buflist = fn.tabpagebuflist(index)
    local bufnr = buflist[winnr]
    local bufname = fn.bufname(bufnr)
    local buftype = vim.bo[bufnr].filetype
    local bufmodified = fn.getbufvar(bufnr, "&mod")

    s = s .. '%' .. index .. 'T'
    if index == fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    s = s .. ' '
    if has_devicons then
      local name = fn.fnamemodify(bufname, ':t')
      local extension = fn.fnamemodify(bufname, ':e')
      local icon, color =
      devicons.get_icon_color(name, extension, {default = true})
      s = s .. icon  
      -- buffer.devicon = {
      --   icon = icon .. ' ',
      --   color = color,
      -- }
    end

    -- tab index
    s = s .. ' '
    if _TABLINE_NVIM_CFG.show_index then
      s = s .. index .. ': '
    end

    -- buf name
    if bufname ~= '' then
      s = s .. fn.fnamemodify(bufname, ':t') .. ' '
    else
      s = s .. _TABLINE_NVIM_CFG.no_name .. ' '
    end

      -- dump(buftype)

    -- modification indicator
    if _TABLINE_NVIM_CFG.show_modify and bufmodified == 1 then
      s = s .. _TABLINE_NVIM_CFG.modify_icon .. ' '
    end
  end

  s = s .. '%#TabLineFill#'
  return s
end

function M.setup(cfg)
  cfg = cfg or {}

  _TABLINE_NVIM_CFG = vim.tbl_extend('force', _TABLINE_NVIM_CFG, cfg)

  function _G.nvim_tabline()
    return tabline(_TABLINE_NVIM_CFG)
  end

  vim.o.showtabline = 2
  vim.o.tabline = "%!v:lua.nvim_tabline()"

  vim.g.loaded_nvim_tabline = 1
end

return M
