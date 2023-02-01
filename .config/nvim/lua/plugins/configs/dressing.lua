-- https://github.com/j-hui/fidget.nvim
local present, dressing = pcall(require, "dressing")

if not present then
  return
end

local config = {
  input = {
    default_prompt = "➤ ",
    win_options = {
      winhighlight = "Normal:Normal,NormalNC:Normal",
    },
  },
  select = {
    backend = { "telescope", "builtin" },
    builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
  },
}

dressing.setup(config)
