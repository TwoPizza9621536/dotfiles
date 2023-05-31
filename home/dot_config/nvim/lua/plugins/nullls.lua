return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "jayp0521/mason-null-ls.nvim",
      "davidmh/cspell.nvim",
    },
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
      local cspell = require("cspell")
      return {
        sources = {
          -- Spelling
          cspell.code_actions,
          cspell.diagnostics,
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
}
