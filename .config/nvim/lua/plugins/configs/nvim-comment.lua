-- https://github.com/terrortylor/nvim-comment
local present, nvim_comment = pcall(require, "nvim_comment")

if not present then
  return
end

local config = {
  -- Should key mappings be created
  create_mappings = false,
  -- should comment out empty or whitespace only lines
  comment_empty = false,

  -- DEFAULTS
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
}

nvim_comment.setup(config)
