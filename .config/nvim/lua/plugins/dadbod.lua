-- https://github.com/kristijanhusak/vim-dadbod-ui

return {
  "tpope/vim-dadbod",
  cmd = { "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  config = function()
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_use_nerd_fonts = 1

    vim.g.db_ui_force_echo_notifications = 1

    vim.g.db_ui_save_location = vim.fn.stdpath("cache") .. "/dbui/saved"
    vim.g.db_ui_tmp_query_location = vim.fn.stdpath("cache") .. "/dbui/queries"

    vim.g.db_ui_table_helpers = {
      mysql = {
        truncate = "TRUNCATE {dbname}.{table}",
      },
      clickhouse = {
        select_latest_limit_1 = "SELECT * FROM {dbname}.{table} ORDER BY tx_time DESC LIMIT 1 FORMAT Vertical",
        select_limit_1 = "SELECT * FROM {dbname}.{table} LIMIT 1 FORMAT Vertical",
        select_limit_200 = "SELECT * FROM {dbname}.{table} LIMIT 200 FORMAT Vertical",
        show_create_table = "SHOW CREATE TABLE {dbname}.{table} FORMAT PrettyNoEscapes",
        describe = "DESCRIBE {dbname}.{table} FORMAT PrettyNoEscapes",
        -- drop_table = 'DROP TABLE {dbname}.{table}',
        count = "SELECT count(*) FROM {dbname}.{table}",
      },
    }
  end,
}
