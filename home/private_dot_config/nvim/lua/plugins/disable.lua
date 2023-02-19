return {
    { "folke/tokyonight.nvim", enabled = false },
    { "catppuccin/nvim", enabled = false, name = "catppuccin" },
    { "echasnovski/mini.comment", enabled = false },
    { "echasnovski/mini.ai", enabled = false },

    -- Disable tab behavior in LuaSnip
    {
        "L3MON4D3/LuaSnip",
        keys = function() return {} end,
    },

    -- Use super tab and add cpm-emoji and cmp-dap
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
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })

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
