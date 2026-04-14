-- Leader --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config --
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true -- 高亮光标行
vim.opt.expandtab = true -- 使用空格代替Tab
vim.opt.tabstop = 4 -- Tab宽度为4
vim.opt.shiftwidth = 4 -- 缩进宽度为4
vim.opt.wrap = false -- 不自动换行
vim.opt.scrolloff = 2 -- 上下保留2行
vim.opt.signcolumn = "yes" -- 永远显示sign column
vim.opt.winborder = "rounded" -- 窗口边框样式
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 包含大写字母时，搜索区分大小写
vim.opt.undofile = true
-- never folding --
vim.opt.foldenable = false 
vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 99

-- Other
vim.opt.clipboard:append("unnamedplus")
