return {
  { "uga-rosa/ccc.nvim", event = "BufEnter", opts = { highlighter = { auto_enable = true } } },

  {
    "ckolkey/ts-node-action",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { "<leader>cA", "<cmd>TSNodeAction<cr>", desc = "Node Action" },
    config = true,
  },

  { "RaafatTurki/hex.nvim", cmd = "HexToggle", config = true },
  { "folke/twilight.nvim", cmd = "Twilight" },
  { "andweeb/presence.nvim", event = "VeryLazy" },
  { "Bekaboo/deadcolumn.nvim", event = "BufReadPost" },
}
