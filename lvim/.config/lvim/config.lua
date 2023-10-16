-- Read the docs: https://www.lunarvim.org/docs/configuration

-- load configs from files
reload "user.go"
reload "user.js"
reload "user.py"
reload "user.copilot"
reload "user.rust"

-- general plugins
table.insert(lvim.plugins,
  { "folke/trouble.nvim" }
)

-- Options
vim.opt.relativenumber = true
lvim.transparent_window = true
