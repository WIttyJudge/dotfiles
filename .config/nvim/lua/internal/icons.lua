local icons = {
  git_branch = '',
  unsaved = '',
  locker = '',


  hint = '',
  info = '',
  warn = '',
  error = '',
  -- header_icon = '  ',
  bug = '',
  trace = '✎',

  git = {
    unstaged = '✹',
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = '',
    ignored = '◌',
  },

  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },

  diff = {
    added = ' ',
    modified = '柳',
    removed = ' ',
  },

  debug = {
    breakpoint = { text = "→", texthl = "Red", linehl = "", numhl = "" },
    stop = { text = "→", texthl = "Green", linehl = "", numhl = "" }
  }
}

return icons
