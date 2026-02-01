-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    sign_priority = 15,
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
      end

      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next Hunk")
      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev Hunk")

      -- Actions
      map({ "n", "x" }, "<leader>ga", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "x" }, "<leader>gu", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
    end,
  },
}
