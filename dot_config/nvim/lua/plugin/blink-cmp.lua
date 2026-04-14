vim.pack.add({ { src= "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })
require('blink.cmp').setup({
    completion = {
      menu = {
        -- don't show the menu automatically
        auto_show = false,
      },
      documentation = {
        -- don't show documentation automatically
        auto_show = false,
      },
      ghost_text = {
        -- don't display the preview text
        -- enabled = vim.g.ai_cmp
        enabled = false,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-space>"] = { "show", "hide", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
    },
})
