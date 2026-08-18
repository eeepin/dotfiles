--[[
Neovim Config by EEpin using vim.pack built in neovim 0.12
Dependencies:
    - ripgrep (mini.pick)
--]]

require("config.options")

-- VSCode owns the UI, completion, LSP, windows, and file navigation. Keep its
-- Neovim instance lightweight and use VSCode commands for editor actions.
if vim.g.vscode then
    require("config.vscode")
    return
end

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
