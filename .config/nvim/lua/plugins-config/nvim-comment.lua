-- https://github.com/terrortylor/nvim-comment

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
  operator_mapping = "gc"
}

require('nvim_comment').setup(config)
