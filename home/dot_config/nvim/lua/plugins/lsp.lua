return {
  -- add additional lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navbuddy",
      cmd = "Navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = {
        lsp = { auto_attach = true }
      }
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- Python
        pyright = {},
        jedi_language_server = {},
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "jayp0521/mason-null-ls.nvim" },
    config = function(_, opts)
      require("null-ls").setup(opts)
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false,
      })
    end,
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- Spelling
          nls.builtins.code_actions.cspell,
          nls.builtins.completion.spell,
          nls.builtins.diagnostics.cspell.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.INFO
            end,
            disabled_filetypes = {
              "alpha",
              "dashboard",
              "help",
              "lazy",
              "neo-tree",
              "TelescopePrompt",
              "Trouble",
            },
          }),
          -- Markdown
          nls.builtins.diagnostics.markdownlint,
          -- Python
          nls.builtins.diagnostics.pylint,
          nls.builtins.formatting.autopep8,
          nls.builtins.formatting.black.with({ extra_args = { "-l", "79" } }),
          nls.builtins.formatting.isort,
        },
      }
    end,
  },

  -- change mason icons
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
}
