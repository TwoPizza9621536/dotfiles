return {
  -- Comments
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = "gC",
      },
    },
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

  -- Markdown
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    opts = {},
  },

  -- Generate GitIgnore
  { "wintermute-cell/gitignore.nvim", cmd = "Gitignore" },
}
