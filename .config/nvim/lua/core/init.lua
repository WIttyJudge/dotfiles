local function disable_builtin_plugins()
  local plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
  }

  for _, plugin in ipairs(plugins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

local function default_providers()
  local providers = {
    "node",
    "perl",
    "python3",
    "ruby",
  }

  for _, provider in ipairs(providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
  end
end

local function load_modules()
  local core_modules = {
    "core.options",
    "core.commands",
    "core.mappings",
    "core.colors",
    "core.autocmds",
  }

  for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      print("Error loading " .. module .. "\n\n" .. err)
      -- error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

local function load_core()
  require "core.global_functions"

  disable_builtin_plugins()
  default_providers()

  load_modules()
end

load_core()
