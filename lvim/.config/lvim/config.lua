-- Read the docs: https://www.lunarvim.org/docs/configuration

-- load configs from files
reload "user.go"
reload "user.c"
reload "user.js"
reload "user.py"
reload "user.rust"
reload "user.copilot"

-- general plugins
table.insert(lvim.plugins,
  { "folke/trouble.nvim", "ojroques/nvim-osc52" }
)

function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    require('osc52').copy_register('+')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })

-- Options
lvim.builtin.dap.active = true
vim.opt.relativenumber = true
lvim.transparent_window = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.auto_install = true
lvim.lsp.automatic_servers_installation = false
