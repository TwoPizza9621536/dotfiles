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

  -- Extend snippets to other filetypes
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local ls = require("luasnip")
        ls.filetype_extend("cpp", { "c" })
        ls.filetype_extend("text", { "license" })
        ls.filetype_extend("typescript", { "javascript" })  
      end,
    },
    opts = function (_, opts)
      local lsff = require("luasnip.extras.filetype_functions")
      opts.ft_func = lsff.from_pos_or_filetype
      opts.load_ft_func = lsff.extend_load_ft({
        cpp = { "c" },
        html = { "javascript", "css" },
        text = { "license" },
        typescript = { "javascript" },
      })
    end,
  },

  -- Setup more competion sources
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
    ---@param opts cmp.ConfigSchema
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
}
