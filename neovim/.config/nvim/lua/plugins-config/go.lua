local config = {
  goimport = 'goimports', -- goimport command
  gofmt = 'gofumpt', -- gofmt cmd,
  max_line_len = 80, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
  test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
  comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ   
  verbose = false, -- output loginf in messages
  dap_debug = false, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true -- set to true to enable dap virtual text
}

require('go').setup(config)
