return {
  -- chrisgrieser/nvim-spider
  nvim_spider = {
    { "w", "<Cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
    { "e", "<Cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
    { "b", "<Cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
  },

  -- numToStr/Comment.nvim
  comment_nvim = {
    {
      "<Leader>/",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
      desc = "Toggle comment",
    },
    {
      "<Leader>/",
      "<ESC><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      mode = "v",
      desc = "Toggle comment",
    },
  },

  grub_fat = {
    {
      "<Leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },

  aerial = {
    { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  },

  kulala = {
    {
      "<Leader>hr",
      function()
        require("kulala").run()
      end,
      mode = "n",
      desc = "Run HTTP query",
    },
  },

  -- nvim-neo-tree/neo-tree.nvim
  neo_tree = {
    { "<C-b>", "<Cmd>Neotree toggle<CR>", desc = "Toggle NvimTree" },
    { "<Leader>hf", "<Cmd>Neotree reveal<CR>", desc = "Find file inside tree" },
  },

  -- Wansmer/treesj
  treesj = {
    { "gS", "<Cmd>TSJSplit<CR>", desc = "Treesj split line" },
    { "gJ", "<Cmd>TSJJoin<CR>", desc = "Treesj join line" },
  },

  -- nguyenvukhang/nvim-toggler
  toggler = {
    { "<Leader>i", desc = "Toggle text inverter" },
  },

  todo_comments = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment",
    },
  },

  -- folke/which-key.nvim
  which_key = {
    "<Leader>",
    '"',
    "'",
    "`",
  },
}
