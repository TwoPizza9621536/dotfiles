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

  -- Set keymap labels
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+generate" },
      },
    },
  },

  -- Markdown
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    config = true,
  },

  -- Generate GitIgnore
  { "wintermute-cell/gitignore.nvim", cmd = "Gitignore" },
}
