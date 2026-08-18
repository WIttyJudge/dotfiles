-- bootstrap lazy.nvim!
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- Handles reading and writing of compressed files.
        "gzip",
        -- Browsing and handling of tar archives.
        "tarPlugin",
        -- Browsing and handling of zip archives.
        "zipPlugin",
        -- Converts the current buffer to an HTML file.
        "tohtml",
        -- The interactive :Tutor.
        "tutor",
        -- The default file explorer.
        "netrwPlugin",
        "netrw",
      },
    },
  },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})
