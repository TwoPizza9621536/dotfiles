return {
  -- Colors
  {
    "uga-rosa/ccc.nvim",
    event = "BufEnter",
    opts = {
      highlighter = {
        auto_enable = true,
      },
    },
  },

  -- Add node actions
  {
    "ckolkey/ts-node-action",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { "<leader>cA", "<cmd>TSNodeAction<cr>", desc = "Node Action" },
    config = true,
  },

  -- Hex Editor
  {
    "RaafatTurki/hex.nvim",
    cmd = { "HexToggle" },
    config = true,
  },

  -- Pasting Images
  { "ekickx/clipboard-image.nvim", cmd = "PasteImg" },

  -- Hide code
  { "folke/twilight.nvim", cmd = "Twilight" },

  -- Discord Integration
  { "andweeb/presence.nvim", event = "VeryLazy" },

  -- Unicode
  { "chrisbra/unicode.vim", cmd = { "UnicodeName", "UnicodeTable" } },

  -- Warn reaching ruler column
  { "Bekaboo/deadcolumn.nvim", event = "BufReadPost" },
}
