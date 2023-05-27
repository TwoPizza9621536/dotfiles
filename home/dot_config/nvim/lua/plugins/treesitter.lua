return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "HiPhish/nvim-ts-rainbow2",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      rainbow = {
        enable = true,
        query = {
          "rainbow-parens",
          html = "rainbow-tags",
          latex = "rainbow-blocks",
          javascript = "rainbow-tags-react",
          tsx = "rainbow-tags",
        },
      },
    },
  },
}
