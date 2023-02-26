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

      local icons = require("lazyvim.config").icons

      local function fg(name)
        -- stylua: ignore
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format('#%06x', hl.foreground) }
        end
      end

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
        sections = {
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            -- stylua: ignore
            {
              function()
                return require('nvim-navic').get_location()
              end,
              cond = function()
                return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
              end,
            },
          },
          -- Use vim-airline defaults for sections Y and Z.
          lualine_x = {
            -- stylua: ignore
            {
              function()
                return require('noice').api.status.command.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.command.has()
              end,
              color = fg('Statement'),
            },
            -- stylua: ignore
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.mode.has()
              end,
              color = fg('Constant'),
            },
            "filetype",
          },
          lualine_y = { "encoding", "fileformat" },
          lualine_z = { "%p%% :%l/%L ☰ :%v" },
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
