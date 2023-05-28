return {
  -- transparent
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  -- colorschemes
  {
    "Mofiqul/vscode.nvim",
    opts = {
      italic_comments = true,
      transparent = vim.g.transparent_enabled,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "hatsune_miku" },
  },

  { "baskerville/bubblegum", event = "VeryLazy" },
  { "doki-theme/doki-theme-vim", event = "VeryLazy", name = "doki-theme" },
  { "tanvirtin/monokai.nvim", event = "VeryLazy" },
}
