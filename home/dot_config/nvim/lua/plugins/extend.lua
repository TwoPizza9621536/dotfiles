return {
  -- add treesitter extensions and parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "HiPhish/nvim-ts-rainbow2",
    },
    opts = {
      context_commentstring = { enable = true, enable_autocmd = false },
      rainbow = { enable = true },
    },
  },

  -- add telescope extensions
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<space>fb",
        ":Telescope file_browser",
        { noremap = true },
      },
    },
    dependencies = {
      {
        "benfowler/telescope-luasnip.nvim",
        config = function()
          require("telescope").load_extension("luasnip")
        end,
      },
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension("dap")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
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

  -- set neotree options
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 40 },
    },
  },

  -- Handle cmp docs with noice
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "rcarriga/cmp-dap" },
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(
        vim.list_extend(opts.sources, { { name = "emoji" } })
      )
      opts.enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
          or require("cmp_dap").is_dap_buffer()
      end
    end,
  },
}
