return {
  -- chrisgrieser/nvim-spider
  nvim_spider = {
    { "w", "<Cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
    { "e", "<Cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
    { "b", "<Cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
  },

  grub_fat = {
    {
      "<leader>sr",
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
      "<leader>hr",
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
    { "<leader>hf", "<Cmd>Neotree reveal<CR>", desc = "Find file inside tree" },
  },

  -- Wansmer/treesj
  treesj = {
    { "gS", "<Cmd>TSJSplit<CR>", desc = "Treesj split line" },
    { "gJ", "<Cmd>TSJJoin<CR>", desc = "Treesj join line" },
  },

  -- nguyenvukhang/nvim-toggler
  toggler = {
    { "<leader>i", desc = "Toggle text inverter" },
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

  -- folke/snacks.nvim
  snacks = {
    -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },

    -- {
    --   "<leader>:",
    --   function()
    --     Snacks.picker.command_history()
    --   end,
    --   desc = "Command History",
    -- },

    {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep under cursor",
      mode = { "n", "x" },
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },

    -- todo comments
    {
      "<leader>st",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Todo",
    },
    {
      "<leader>sT",
      function()
        Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
      end,
      desc = "Todo/Fix/Fixme",
    },

    -- zen mode
    {
      "<leader>uz",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },

    -- lazygit
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit (cwd)",
    },

    -- git
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log (cwd)",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Current File History",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      mode = { "n", "x" },
      desc = "Git Browse (open)",
    },
    {
      "<leader>gY",
      function()
        Snacks.gitbrowse({
          open = function(url)
            vim.fn.setreg("+", url)
          end,
          notify = false,
        })
      end,
      mode = { "n", "x" },
      desc = "Git Browse (copy)",
    },
  },

  -- sindrets/diffview.nvim
  diffview = {
    { "<leader>gc", "<Cmd>DiffviewFileHistory<CR>", desc = "Open diff view file history" },
  },

  -- folke/sidekick.nvim
  sidekick = {
    -- {
    --   "<tab>",
    --   function()
    --     -- if there is a next edit, jump to it, otherwise apply it if any
    --     if not require("sidekick").nes_jump_or_apply() then
    --       return "<Tab>" -- fallback to normal tab
    --     end
    --   end,
    --   expr = true,
    --   desc = "Goto/Apply Next Edit Suggestion",
    -- },
    {
      "<c-.>",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },

    -- -- Example of a keybinding to open Claude directly
    -- {
    --   "<leader>ac",
    --   function()
    --     require("sidekick.cli").toggle({ name = "claude", focus = true })
    --   end,
    --   desc = "Sidekick Toggle Claude",
    -- },
  },

  -- folke/flash.nvim
  flash = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
