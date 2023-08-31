return {
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

  { "LazyVim/LazyVim", opts = { colorscheme = "visual_studio_code_dark" } },
  {
    "askfiy/visual_studio_code",
    opts = {
      transparent = vim.g.transparent_enabled,
    },
  },
  { "TwoPizza9621536/bubblegum", event = "VeryLazy" },
  { "doki-theme/doki-theme-vim", event = "VeryLazy", name = "doki-theme" },
  { "tanvirtin/monokai.nvim", event = "VeryLazy" },
}
