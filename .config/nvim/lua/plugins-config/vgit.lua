-- https://github.com/tanvirtin/vgit.nvim

local config = {
  disabled = false,
  debug = false,
  hunks_enabled = true,
  blames_enabled = false,
  diff_strategy = 'index',
  diff_preference = 'horizontal',
  predict_hunk_signs = true,
  action_delay_ms = 300,
  predict_hunk_throttle_ms = 300,
  predict_hunk_max_lines = 50000,
  blame_line_throttle_ms = 150,
  show_untracked_file_signs = true,
  signs = {
    VGitViewSignAdd = {
      name = 'VGitViewSignAdd',
      line_hl = 'VGitViewSignAdd',
      text_hl = 'VGitViewTextAdd',
      text = '+'
    },
    VGitViewSignRemove = {
      name = 'VGitViewSignRemove',
      line_hl = 'VGitViewSignRemove',
      text_hl = 'VGitViewTextRemove',
      text = '-'
    },
    VGitSignAdd = {
      name = 'VGitSignAdd',
      text_hl = 'VGitSignAdd',
      num_hl = nil,
      line_hl = nil,
      text = '│',
    },
    VGitSignRemove = {
      name = 'VGitSignRemove',
      text_hl = 'VGitSignRemove',
      num_hl = nil,
      line_hl = nil,
      text = '│',
    },
    VGitSignChange = {
      name = 'VGitSignChange',
      text_hl = 'VGitSignChange',
      num_hl = nil,
      line_hl = nil,
      text = '│',
    }
  },
  hls = {
    VGitBlame = { bg = nil, fg = '#b1b1b1' },

    VGitDiffAddSign = { bg = '#3d5213', fg = nil },
    VGitDiffRemoveSign = { bg = '#4a0f23', fg = nil },
    VGitDiffAddText = { fg = '#6a8f1f', bg = '#3d5213' },
    VGitDiffRemoveText = { fg = '#a3214c', bg = '#4a0f23' },

    VGitHunkAddSign = { bg = '#3d5213', fg = nil },
    VGitHunkRemoveSign = { bg = '#4a0f23', fg = nil },
    VGitHunkAddText = { fg = '#6a8f1f', bg = '#3d5213' },
    VGitHunkRemoveText = { fg = '#a3214c', bg = '#4a0f23' },
    VGitHunkSignAdd = { fg = '#d7ffaf', bg = '#4a6317' },
    VGitHunkSignRemove = { fg = '#e95678', bg = '#63132f' },

    VGitSignAdd = { fg = '#a9b665', bg = nil },
    VGitSignChange = { fg = '#7daea3', bg = nil },
    VGitSignRemove = { fg = '#ea6962', bg = nil },

    VGitIndicator = { fg = '#a6e22e', bg = nil },

    VGitBorder = { fg = '#a1b5b1', bg = nil },
    VGitBorderFocus = { fg = '#7AA6DA', bg = nil }
  },
  blame_line = {
    hl = 'VGitBlame',
    format = function(blame, git_config)
      local function round(x)
        return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
      end
      local config_author = git_config['user.name']
      local author = blame.author
      if config_author == author then
        author = 'You'
      end
      local time = os.difftime(os.time(), blame.author_time) / (24 * 60 * 60)
      local time_format = string.format('%s days ago', round(time))
      local time_divisions = {
        { 24, 'hours' }, { 60, 'minutes' }, { 60, 'seconds' }
      }
      local division_counter = 1
      while time < 1 and division_counter ~= #time_divisions do
        local division = time_divisions[division_counter]
        time = time * division[1]
        time_format = string.format('%s %s ago', round(time), division[2])
        division_counter = division_counter + 1
      end
      local commit_message = blame.commit_message
      if not blame.committed then
        author = 'You'
        commit_message = 'Uncommitted changes'
        local info = string.format('%s • %s', author, commit_message)
        return string.format(' %s', info)
      end
      local max_commit_message_length = 255
      if #commit_message > max_commit_message_length then
        commit_message = commit_message:sub(1, max_commit_message_length)
                             .. '...'
      end
      local info = string.format('%s, %s • %s', author, time_format,
                                 commit_message)
      return string.format(' %s', info)
    end
  },
  blame = {
    window = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder'
    }
  },
  preview = {
    priority = 10,
    horizontal_window = {
      title = 'Preview',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    current_window = {
      title = 'Current',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    previous_window = {
      title = 'Previous',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    signs = { add = 'VGitViewSignAdd', remove = 'VGitViewSignRemove' }
  },
  history = {
    indicator = { hl = 'VGitIndicator' },
    horizontal_window = {
      title = 'Preview',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    current_window = {
      title = 'Current',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    previous_window = {
      title = 'Previous',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    },
    history_window = {
      title = 'Git History',
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder',
      border_focus_hl = 'VGitBorderFocus'
    }
  },
  hunk = {
    priority = 10,
    window = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder'
    },
    signs = { add = 'VGitViewSignAdd', remove = 'VGitViewSignRemove' }
  },
  hunk_lens = {
    priority = 10,
    window = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      border_hl = 'VGitBorder'
    },
    signs = { add = 'VGitViewSignAdd', remove = 'VGitViewSignRemove' }
  },
  blame_preview_popup = {
    blame_window = {
      border = { '╭', '─', '─', '│', '─', '─', '╰', '│' },
      border_hl = 'VGitBorder'
    },
    preview_window = {
      border = { '─', '─', '╮', '│', '╯', '─', '─', ' ' },
      border_hl = 'VGitBorder'
    }
  },
  hunk_sign = {
    priority = 10,
    signs = {
      add = 'VGitSignAdd',
      remove = 'VGitSignRemove',
      change = 'VGitSignChange'
    }
  }
}

require('vgit').setup(config)
