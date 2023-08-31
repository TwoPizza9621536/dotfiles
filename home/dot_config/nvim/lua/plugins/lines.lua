return {
  {
    "akinsho/bufferline.nvim",
    config = function(_, opts)
      require("bufferline").setup(opts)
      vim.g.transparent_groups = vim.list_extend(
        vim.g.transparent_groups or {},
        vim.tbl_map(function(v)
          return v.hl_group
        end, vim.tbl_values(require("bufferline.config").highlights))
      )
    end,
    opts = {
      options = {
        themable = true,
        always_show_bufferline = true,
        numbers = function(opts)
          return ("%d·%d").format(opts.raise(opts.ordinal), opts.lower(opts.id))
        end,
        show_close_icon = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")

      return {
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          extenstions = {
            "lazy",
            "man",
            "neo-tree",
            "symbols-outline",
          },
        },
        sections = {
          lualine_a = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = Util.fg("Statement"),
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = Util.fg("Constant"),
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = Util.fg("Debug"),
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
          },
          lualine_b = {
            { "branch", icon = "" },
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
            {
              "mode",
              fmt = function(content, _)
                return ("-- %s --"):format(content)
              end,
            },
          },
          lualine_c = {
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
            },
          },
          lualine_x = {
            {
              "space_style",
              fmt = function()
                local expand = vim.opt_local.expandtab:get()
                local width = vim.opt_local.shiftwidth:get()
                local style = expand and "Spaces" or "Tab Size"
                return ("%s: %d"):format(style, width)
              end,
            },
            "encoding",
            {
              "fileformat",
              icons_enabled = false,
              fmt = function(content, _)
                local style = {
                  mac = "CR",
                  unix = "LF",
                  dos = "CRLF",
                }
                return style[content]
              end,
            },
          },
          lualine_y = {
            {
              "location",
              padding = { left = 0, right = 1 },
              fmt = function(content, _)
                local _, _, current_line, current_column = string.find(content, "(%d+):(%d+)")
                return ("%d:%d"):format(current_line, current_column)
              end,
            },
            {
              "progress",
              fmt = function(content, _)
                local visual_str = {
                  ["v"] = true,
                  ["V"] = true,
                  ["\22"] = true,
                }

                if visual_str[tostring(vim.fn.mode())] then
                  local ln_beg = vim.fn.line("v")
                  local ln_end = vim.fn.line(".")
                  local lines = ln_beg <= ln_end and ln_end - ln_beg + 1 or ln_beg - ln_end + 1
                  return ("- %d -"):format(tostring(lines))
                end

                return content
              end,
            },
          },
          lualine_z = {
            { "filetype" },
          },
        },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function(_, opts)
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
      require("indent_blankline").setup(opts)
    end,
    opts = {
      char_list = { "|", "¦", "┆", "┊" },
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      filetype_exclude = {
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
      use_treesitter = true,
    },
  },
}
