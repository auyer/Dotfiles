-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "ruff"
vim.opt.signcolumn = "yes"
vim.g.autoformat = false
vim.opt.wrap = true
vim.opt.expandtab = false

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4    -- Number of spaces for each step of (auto)indent
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4   -- Number of spaces that a <Tab> counts for while performing editing operations

