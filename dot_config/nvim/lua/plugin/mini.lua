vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require('mini.basics').setup()
require('mini.surround').setup()
local clue = require('mini.clue')
clue.setup({
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<leader>' },
        { mode = { 'n', 'x' }, keys = '<localleader>' },
        -- `[` and `]` keys
        { mode = 'n', keys = '[', desc = '+Prev' },
        { mode = 'n', keys = ']', desc = '+Next' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g', desc = '+Goto' },
        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z', desc = '+Fold' },
        -- search
        { mode = { 'n' }, keys = '/' }, 
        { mode = { 'n' }, keys = '?' },
        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },
        -- Registers
        { mode = { 'n', 'x' }, keys = '"' }, 
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        -- Window commands
        { mode = 'n', keys = '<C-w>' },
    },
    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        { mode = 'n', keys = '<leader>b', desc = '+Buffers' },
        { mode = 'n', keys = '<leader>c', desc = '+Code' },
        { mode = 'n', keys = '<leader>d', desc = '+Debug' },
        { mode = 'n', keys = '<leader>f', desc = '+Files' },
        { mode = 'n', keys = '<leader>g', desc = '+Git' },
        { mode = 'n', keys = '<leader>l', desc = '+LSP' },
        { mode = 'n', keys = '<leader>o', desc = '+OpenCode' },
        { mode = 'n', keys = '<leader>q', desc = '+Quit/Session' },
        { mode = 'n', keys = '<leader>u', desc = '+Ui' },
        { mode = 'n', keys = '<leader>w', desc = '+Windows' },
        { mode = 'n', keys = '<leader>x', desc = '+Diagnostics/Quickfix' },
        { mode = 'n', keys = '<leader><tab>', desc = '+Tabs' },
        clue.gen_clues.square_brackets(),
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
    },
    show_on_trigger = true,
})
-- mini starter setup
local starter = require('mini.starter')
starter.setup({
    evaluate_single = true,
    header = table.concat({
        "██╗  ██╗██╗    ███████╗███████╗██████╗ ██╗███╗   ██╗",
        "██║  ██║██║    ██╔════╝██╔════╝██╔══██╗██║████╗  ██║",
        "███████║██║    █████╗  █████╗  ██████╔╝██║██╔██╗ ██║",
        "██╔══██║██║    ██╔══╝  ██╔══╝  ██╔═══╝ ██║██║╚██╗██║",
        "██║  ██║██║    ███████╗███████╗██║     ██║██║ ╚████║",
        "╚═╝  ╚═╝╚═╝    ╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═══╝",
    }, "\n"),
    items = {
        { action = 'Pick files', name = 'Files', section = 'Pick' },
        { action = 'Pick greo_live', name = 'Grep live', section = 'Pick' },
        starter.sections.recent_files(5, true),
        starter.sections.sessions(3, true),
        starter.sections.builtin_actions(),
    },
    content_hooks = {
        starter.gen_hook.adding_bullet("░ ", false),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.aligning("center", "center"),
    },
})
require('mini.pick').setup()
require('mini.icons').setup()
require('mini.fuzzy').setup()
require('mini.sessions').setup()
