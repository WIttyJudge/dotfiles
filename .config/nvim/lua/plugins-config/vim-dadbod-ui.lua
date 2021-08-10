-- https://github.com/kristijanhusak/vim-dadbod-ui

vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_use_nerd_fonts = 1

vim.g.db_ui_force_echo_notifications = 1


vim.g.db_ui_table_helpers = {
  mysql = {
    delete_from = "DELETE FROM {table} WHERE table = "
  },
 	clickhouse = {
    select_limit_1 = 'SELECT * FROM {table} limit 1 FORMAT Vertical',
 		show_create_table = 'SHOW CREATE TABLE {table} FORMAT PrettyNoEscapes',
 		describe = 'DESCRIBE {table} FORMAT PrettyNoEscapes'
 	}
}
