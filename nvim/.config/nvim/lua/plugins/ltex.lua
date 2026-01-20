-- This plugin depends on on of these two LSP servers to configured
--   https://github.com/valentjn/ltex-ls
--   https://github.com/ltex-plus/ltex-ls-plus
return {
  "barreiroleo/ltex_extra.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
	event = { "LspAttach *.md", "LspAttach *.tex", "LspAttach *.sty" },

  opts = {
    load_langs = { "en-US", "pt-BR" },
    -- save to .ltex dir
    path = ".ltex",
  },

  config = function(_, opts)
    -- Ltex LSP
    vim.lsp.config("ltex_plus", {
      on_attach = function()
        require("ltex_extra").setup(opts)
      end,

      settings = {
        ltex = {
          languageToolHttpServerUri = "http://lt.rcpassos.lan/",
          checkFrequency = 'save',
          language = 'en-US',       -- default language
					additionalRules = {
						enablePickyRules = true,
						-- motherTongue = "pt-BR",
					},
          enabled = {
						'markdown',
						'plaintex',
						'rst',
						'tex',
						'latex',
						"bib",
            "gitcommit",
            "mail",
            "norg",
            "org",
            "pandoc",
            "text",
					},
        },
      },
    })
  end,
}
