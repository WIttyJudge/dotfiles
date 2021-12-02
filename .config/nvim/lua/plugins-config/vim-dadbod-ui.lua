-- https://github.com/kristijanhusak/vim-dadbod-ui

vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_use_nerd_fonts = 1

vim.g.db_ui_force_echo_notifications = 1

vim.g.db_ui_save_location = vim.fn.stdpath('cache') .. '/dbui/saved'
vim.g.db_ui_tmp_query_location = vim.fn.stdpath('cache') .. '/dbui/queries'


vim.g.db_ui_table_helpers = {
  mysql = {
    delete_from = 'DELETE FROM {table} WHERE table = '
  },
 	clickhouse = {
    select_latest_limit_1 = 'SELECT * FROM {table} ORDER BY tx_time DESC LIMIT 1 FORMAT Vertical',
    select_limit_1 = 'SELECT * FROM {table} LIMIT 1 FORMAT Vertical',
    select_limit_200 = 'SELECT * FROM {table} limit 200 FORMAT Vertical',
 		show_create_table = 'SHOW CREATE TABLE {table} FORMAT PrettyNoEscapes',
 		describe = 'DESCRIBE {table} FORMAT PrettyNoEscapes',
 		drop_table = 'DROP TABLE {table}',
 		count = 'SELECT count(*) FROM {table}',
 	}
}
