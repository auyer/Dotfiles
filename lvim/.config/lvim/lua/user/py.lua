-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "ruff_lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- lvim.lang.python.lsp.provider = nil
require("lvim.lsp.manager").setup("ruff_lsp")
------------------------
-- Treesitter
------------------------
table.insert(lvim.builtin.treesitter.ensure_installed,
  {
    "python",
  })

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "ruff", filetypes = { "python" } },
}

table.insert(lvim.format_on_save,
  {
    pattern = { "*.py" },
  }
)

------------------------
-- Plugins
------------------------
table.insert(lvim.plugins,
  {
    "AckslD/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
    -- 'dccsillag/magma-nvim',
  }
)

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "ruff", filetypes = { "python" } },
}

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching
require("swenv").setup({
  post_set_env = function()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["v"] = {
  name = "Python",
  v = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
-- lvim.keys.normal_mode["ce"] = "<cmd>lua require('swenv.api').pick_venv()<cr>"
