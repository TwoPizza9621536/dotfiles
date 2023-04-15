return {
  -- colorschemes
  {
    "Mofiqul/vscode.nvim",
    config = function(_, opts)
      require("vscode").setup(opts)
      vim.cmd("highlight BufferLineFill guibg=NONE")
    end,
    opts = {
      italic_comments = true,
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },

  { "baskerville/bubblegum", event = "VeryLazy" },
  { "doki-theme/doki-theme-vim", event = "VeryLazy", name = "doki-theme" },
  { "tanvirtin/monokai.nvim", event = "VeryLazy" },

  -- disable bundled themes
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false, name = "catppuccin" },  
}
