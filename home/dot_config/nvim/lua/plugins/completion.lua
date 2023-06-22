return {
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

  {
    "rafamadriz/friendly-snippets",
    config = function()
      local luasnip = require("luasnip")

      luasnip.filetype_extend("cpp", { "c" })
      luasnip.filetype_extend("csharp", { "csharpdoc" })
      luasnip.filetype_extend("html", { "javascript", "css" })
      luasnip.filetype_extend("java", { "javadoc" })
      luasnip.filetype_extend("javascript", { "jsdoc" })
      luasnip.filetype_extend("lua", { "luadoc" })
      luasnip.filetype_extend("python", { "pydoc" })
      luasnip.filetype_extend("rust", { "rustdoc" })

      luasnip.filetype_extend("typescript", { "javascript", "tsdoc" })
      luasnip.filetype_extend("javascriptreact", { "html", "javascript", "react" })
      luasnip.filetype_extend(
        "typescriptreact",
        { "html", "javascript", "javascriptreact", "react-ts" }
      )

      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
