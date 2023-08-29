-- Setup lsp.
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "eslint", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css" } },
}

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "eslint", filetypes = { "javascript", "typescript" } },
})
