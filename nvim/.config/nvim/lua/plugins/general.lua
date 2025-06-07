-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin-mocha",
  --   },
  -- },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "VeryLazy", -- Or `LspAttach`
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
      -- vim.diagnostic.config({ virtual_text = false })
      -- -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = {
      modes = {
        lsp = {
          win = { position = "left" },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- 	virtual_text = false,
        float = {
          border = "rounded",
        },
      },
      ui = {
        windows = {
          default_options = {
            border = "rounded",
          },
        },
      },
    },
  },
  --   {
  --    "simrat39/rust-tools.nvim",
  --    dependencies = "neovim/nvim-lspconfig",
  --    config = function()
  --      local rt = require("rust-tools")
  --
  --      rt.setup({
  --        server = {
  --          on_attach = require("lazyvim.util").on_attach(function(_, bufnr)
  --            -- Hover actions
  --            vim.keymap.set("n", "K, rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover" })
  --            -- Code action groups
  --            vim.keymap.set(
  --              "n",
  --              "<Leader>ca",
  --              rt.code_action_group.code_action_group,
  --              { buffer = bufnr, desc = "Code Action" }
  --            )
  --          end),
  --        },
  --      })
  --    end,
  --  },
  -- },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "csv",
        "html",
        "hcl",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "yaml",
        "rst",
        "svelte",

        -- "go", "gomod", "gowork", "gosum"
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "ojroques/vim-oscyank",
    config = function()
      -- Should be accompanied by a setting clipboard in tmux.conf, also see
      -- https://github.com/ojroques/vim-oscyank#the-plugin-does-not-work-with-tmux
      vim.g.oscyank_term = "default"
      vim.g.oscyank_max_length = 0 -- unlimited
      -- Below autocmd is for copying to OSC52 for any yank operation,
      -- see https://github.com/ojroques/vim-oscyank#copying-from-a-register
      vim.api.nvim_create_autocmd("TextYankPost", {
        pattern = "*",
        callback = function()
          if vim.v.event.operator == "y" and vim.v.event.regname == "" then
            vim.cmd('OSCYankRegister "')
          end
        end,
      })
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        max_length = 0, -- Maximum length of selection (0 for no limit)
        silent = false, -- Disable message on successful copy
        trim = false, -- Trim surrounding whitespaces before copy
      })
      local function copy()
        if (vim.v.event.operator == "y" or vim.v.event.operator == "d") and vim.v.event.regname == "" then
          require("osc52").copy_register("")
        end
      end

      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },
}
