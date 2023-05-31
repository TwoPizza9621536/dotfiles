return {
  -- transparent
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NormalFloat",
        "NeoTreeDirectoryName",
        "NeoTreeDirectoryIcon",
      },
    },
  },

  -- colorschemes
  { "LazyVim/LazyVim", opts = { colorscheme = "vscode" } },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      italic_comments = true,
      transparent = vim.g.transparent_enabled,
    },
  },
  { "baskerville/bubblegum", event = "VeryLazy" },
  { "doki-theme/doki-theme-vim", event = "VeryLazy", name = "doki-theme" },
  { "tanvirtin/monokai.nvim", event = "VeryLazy" },
}
