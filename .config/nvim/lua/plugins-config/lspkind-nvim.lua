-- https://github.com/onsails/lspkind-nvim

M = {}

M.config = {
  with_text = true,
  symbol_map = {
    Text = '',
    Method = 'ƒ',
    Function = '',
    Constructor = '',
    Field = "ﰠ",
    Variable = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '﬌',
    Color = '',
    File = '',
    Reference = "",
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = "",
    jOperator = "",
    TypeParameter = "",
  },
}

require('lspkind').init(config)

return M
