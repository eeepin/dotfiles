local map = vim.keymap.set

local function vscode_action(name)
    return function()
        require("vscode").action(name)
    end
end

local function set_relative_number(enabled)
    require("vscode").eval_async([[
        const editor = vscode.window.activeTextEditor
        if (editor) {
            editor.options.lineNumbers = args.enabled
                ? vscode.TextEditorLineNumbersStyle.Relative
                : vscode.TextEditorLineNumbersStyle.On
        }
    ]], {
        args = { enabled = enabled },
    })
end

local line_number_group = vim.api.nvim_create_augroup("vscode_line_numbers", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
    group = line_number_group,
    callback = function()
        set_relative_number(false)
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    group = line_number_group,
    callback = function()
        set_relative_number(true)
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = line_number_group,
    callback = function()
        set_relative_number(vim.fn.mode():match("^i") == nil)
    end,
})

-- Editing behavior that is useful in both VSCode and terminal Neovim.
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("x", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("x", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ";", ";<C-g>u")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- VSCode-native UI and file actions.
map("n", "<leader>h", vscode_action("workbench.action.showCommands"), { desc = "Show Commands" })
map("n", "<leader>K", vscode_action("editor.action.showHover"), { desc = "Show Hover" })
map("n", "<leader>ur", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })
map("n", "<leader>f", vscode_action("workbench.action.quickOpen"), { desc = "Open File" })
map("n", "<leader>fe", vscode_action("workbench.view.explorer"), { desc = "Open Explorer" })
map("n", "<leader>fn", vscode_action("workbench.action.files.newUntitledFile"), { desc = "New File" })

map("n", "<leader>b", vscode_action("workbench.action.showAllEditors"), { desc = "Show Editors" })
map("n", "<leader>bh", vscode_action("workbench.action.previousEditor"), { desc = "Previous Editor" })
map("n", "<leader>bl", vscode_action("workbench.action.nextEditor"), { desc = "Next Editor" })
map("n", "<leader>bb", vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditor"), { desc = "Recent Editor" })
map("n", "<leader>bD", vscode_action("workbench.action.closeActiveEditor"), { desc = "Close Editor" })

map("n", "<leader>w-", vscode_action("workbench.action.splitEditorDown"), { desc = "Split Editor Down" })
map("n", "<leader>w|", vscode_action("workbench.action.splitEditorRight"), { desc = "Split Editor Right" })
map("n", "<leader>wd", vscode_action("workbench.action.closeActiveEditor"), { desc = "Close Editor" })
map("n", "<leader>wh", vscode_action("workbench.action.focusLeftGroup"), { desc = "Focus Left Group" })
map("n", "<leader>wj", vscode_action("workbench.action.focusBelowGroup"), { desc = "Focus Below Group" })
map("n", "<leader>wk", vscode_action("workbench.action.focusAboveGroup"), { desc = "Focus Above Group" })
map("n", "<leader>wl", vscode_action("workbench.action.focusRightGroup"), { desc = "Focus Right Group" })
map("n", "<leader>ww", vscode_action("workbench.action.navigateEditorGroups"), { desc = "Navigate Editor Groups" })

map("n", "<leader>d]d", vscode_action("editor.action.marker.next"), { desc = "Next Diagnostic" })
map("n", "<leader>d[d", vscode_action("editor.action.marker.prev"), { desc = "Previous Diagnostic" })
map("n", "<leader>dd", vscode_action("editor.action.showHover"), { desc = "Show Diagnostics" })

map("n", "<leader>lf", vscode_action("editor.action.formatDocument"), { desc = "Format Document" })
map("n", "<leader>lr", vscode_action("editor.action.rename"), { desc = "Rename Symbol" })
map("n", "<leader>ca", vscode_action("editor.action.quickFix"), { desc = "Code Action" })
map("n", "<leader>ld", vscode_action("editor.action.revealDefinition"), { desc = "Go to Definition" })
map("n", "<leader>lD", vscode_action("editor.action.revealDeclaration"), { desc = "Go to Declaration" })
map("n", "<leader>li", vscode_action("editor.action.goToImplementation"), { desc = "Go to Implementation" })
map("n", "<leader>lR", vscode_action("editor.action.goToReferences"), { desc = "Find References" })

map("n", "<leader>gg", vscode_action("workbench.view.scm"), { desc = "Open Source Control" })
map("n", "<leader>qq", vscode_action("workbench.action.closeAllEditors"), { desc = "Close All Editors" })

-- Editing plugins are safe in VSCode; avoid loading mini's UI-oriented modules.
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("mini.surround").setup()
