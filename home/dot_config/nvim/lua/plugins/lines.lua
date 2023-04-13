return {
  -- bufferline
  {
    "akinsho/nvim-bufferline.lua",
    opts = {
      options = {
        numbers = function(opts)
          return string.format(
            "%s·%s",
            opts.raise(opts.ordinal),
            opts.lower(opts.id)
          )
        end,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- Port the bubblegum theme from vim-airlines
      local colors = {
        dark_gray = "#303030",
        med_gray_hi = "#444444",
        med_gray_lo = "#3a3a3a",
        light_gray = "#b2b2b2",
        green = "#afd787",
        blue = "#87afd7",
        purple = "#afafd7",
        orange = "#d7af5f",
        red = "#d78787",
        pink = "#d7afd7",
      }

      local bubblegum = {
        normal = {
          a = { bg = colors.green, fg = colors.dark_gray },
          b = { bg = colors.med_gray_lo, fg = colors.light_gray },
          c = { bg = colors.med_gray_hi, fg = colors.green },
        },
        insert = {
          a = { bg = colors.blue, fg = colors.med_gray_hi },
          c = { bg = colors.med_gray_hi, fg = colors.blue },
        },
        visual = {
          a = { bg = colors.pink, fg = colors.dark_gray },
          c = { bg = colors.med_gray_hi, fg = colors.pink },
        },
        replace = {
          a = { bg = colors.red, fg = colors.dark_gray },
          c = { bg = colors.med_gray_hi, fg = colors.red },
        },
        inactive = {
          a = { bg = colors.med_gray_hi, fg = colors.light_gray },
          b = { bg = colors.med_gray_hi, fg = colors.light_gray },
          c = { bg = colors.med_gray_hi, fg = colors.light_gray },
        },
      }

      return {
        extensions = {
          "man",
          "nvim-dap-ui",
          "nvim-tree",
        },
        options = {
          disabled_filetypes = {
            statusline = { "dashboard", "lazy", "alpha" },
          },
          globalstatus = true,
          theme = bubblegum,
        },
      }
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function(_, opts)
      -- stylua: ignore start
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

      require('indent_blankline').setup(opts)
    end,
    opts = {
      char = "┆",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      filetype_exclude = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "Trouble",
      },
      show_current_context = true,
      show_current_context_start = true,
      show_end_of_line = true,
      show_trailing_blankline_indent = false,
      space_char_blankline = " ",
    },
  },
}
