return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "rcarriga/cmp-dap" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>nf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Generate Comment (function)",
        silent = true,
      },
      {
        "<leader>nF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        desc = "Generate Comment (file)",
        silent = true,
      },
      {
        "<leader>nc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Generate Comment (class)",
        silent = true,
      },
      {
        "<leader>nt",
        function()
          require("neogen").generate({ type = "type" })
        end,
        desc = "Generate Comment (type)",
        silent = true,
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+generate" },
      },
    },
  },

  { "wintermute-cell/gitignore.nvim", cmd = "Gitignore" },
}
