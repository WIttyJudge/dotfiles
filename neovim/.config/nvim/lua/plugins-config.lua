local required = {
  lualine = {
    enable = true
  },

  formatter = {
    enable = true
  },

  gitsigns = {
    enable = true
  },

  go = {
    enable = true
  },
  
  indentLine = {
    enable = true
  },
  
  lspsaga = {
    enable = true
  },
  
  lspkind-nvim = {
    enable = true
  },
  
  lualine = {
    enable = true
  },
  
  neoscroll-nvim = {
    enable = true
  },
  
  nvim-colorizer = {
    enable = true
  },
  
  nvim-comment = {
    enable = true
  },
  
  -- nvim-echo-diagnostics = {
  -- enable = true
  -- },
  
  nvim-hlslens = {
    enable = true
  },
  
  nvim-tree = {
    enable = true
  },
  
  nvim-tabline = {
    enable = true
  },
  
  nvim-treesitter = {
    enable = true
  },
  
  surround = {
    enable = true
  },
  
  -- telescope = {
  -- enable = true
  -- },
  
  todo-comments = {
    enable = true
  },
   
  toggle-formatting = {
    enable = true
  },
  
  undotree = {
    enable = true
  },
  
  vim-rooter = {
    enable = true
  },
  
  vim-startify = {
    enable = true
  },
  
  vsnip = {
    enable = true
  },
}

function plugin_is_enabled(plugin)
  if required[plugin] == nil then 
    print(plugin .. ' is not exists')
    return false
  end

  return required[plugin].enable
end

return plugin_is_enabled 
