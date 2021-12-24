-- https://github.com/airblade/vim-rooter

-- Trigger vim-rooter only if folder has this files
vim.g.rooter_patterns = { '.git', 'Makefile', '.env', '.env.example' }

vim.g.rooter_change_directory_for_non_project_files = 'current'

vim.g.rooter_silent_chdir = 1
