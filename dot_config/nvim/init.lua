--[[
Neovim Config by EEpin using vim.pack built in neovim 0.12
Dependencies:
    - ripgrep (mini.pick)
--]]

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.colorschema")

-- All Plugin Configs Are in lua/plugin/*.lua --
require("plugin.mini")
require("plugin.mason")
require("plugin.nvim-lspconfig")
require("plugin.nvim-treesitter")
require("plugin.oil")
require("plugin.blink-cmp")
require("plugin.ui")
require("plugin.opencode")
require("plugin.lazygit")
