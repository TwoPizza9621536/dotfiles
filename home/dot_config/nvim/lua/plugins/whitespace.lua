return {
  {
    "mcauley-penney/tidy.nvim",
    event = "BufWritePre",
    opts = {
      filetype_exclude = {
        "help",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
      },
    },
  },
  {
    "jdhao/whitespace.nvim",
    cmd = "StripTrailingWhitespace",
    keys = {
      {
        "<leader>t",
        "<cmd>StripTrailingWhitespace<cr>",
        desc = "Trim Whitespace",
      },
    },
    config = function()
      vim.g.trailing_whitespace_exclude_filetypes = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "Trouble",
      }
    end,
  },
}
