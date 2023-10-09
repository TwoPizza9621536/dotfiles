return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navbuddy",
      cmd = "Navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        lsp = { auto_attach = true },
      },
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        omnisharp = {},
      },
      setup = {},
    },
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "davidmh/cspell.nvim",
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      -- local cspell = require("cspell")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- cspell.code_actions,
        -- cspell.diagnostics,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.pylint,
        nls.builtins.formatting.autopep8,
        nls.builtins.formatting.black.with({ extra_args = { "-l", "79" } }),
        nls.builtins.formatting.isort,
      })
    end,
  },

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
