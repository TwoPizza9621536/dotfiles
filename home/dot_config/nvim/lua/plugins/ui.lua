return {
  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      keys = {
        {
          "n",
          function()
            vim.cmd([[execute("normal! " . v:count1 . "n")]])
            require("hlslens").start()
          end,
          desc = "Jump to Next Matching Word",
        },
        {
          "N",
          function()
            vim.cmd([[execute("normal! " . v:count1 . "N")]])
            require("hlslens").start()
          end,
          desc = "Jump to Previous Matching Word",
        },
        {
          "*",
          [[*<cmd>lua require("hlslens").start()<cr>]],
          desc = "Find Next Matching Word",
        },
        {
          "#",
          [[#<cmd>lua require("hlslens").start()<cr>]],
          desc = "Find Previous Matching Word",
        },
        {
          "n",
          "g*",
          [[g*<cmd>lua require("hlslens").start()<cr>]],
          { desc = "Find Next Whole Word" },
        },
        {
          "g#",
          [[g#<cmd>lua require("hlslens").start()<cr>]],
          desc = "Find Previous Whole Word",
        },
      },
      opts = {},
    },
    event = "BufReadPost",
    config = function(_, opts)
      require("scrollbar").setup(opts)
      require("scrollbar.handlers.search").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
    opts = { handle = { color = "#808080" } },
  },

  -- Set notify background_color to transparent
  {
    "rcarriga/nvim-notify",
    config = function(_, opts)
      require("notify").setup(opts)
      require("telescope").load_extension("notify")
    end,
    opts = {
      background_colour = "#000000",
    },
  },

  -- outline symbols
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      {
        "<leader>cs",
        "<cmd>SymbolsOutline<cr>",
        desc = "Symbols Outline",
      },
    },
    config = true,
  },
}
