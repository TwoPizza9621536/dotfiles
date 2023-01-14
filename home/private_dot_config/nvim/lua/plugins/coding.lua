-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        keys = {
            {
                "<tab>",
                function()
                    return require("luasnip").jumpable(1)
                            and "<Plug>luasnip-jump-next"
                        or "<tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<tab>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s",
            },
            {
                "<s-tab>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" },
            },
        },
        opts = { history = true },
    },

    {
        "danymat/neogen",
        cmd = "Neogen",
        keys = {
            { "<leader>cg", desc = "Generate Comment" },
            {
                "<leader>cgf",
                function()
                    require("neogen").generate { type = "func" }
                end,
                desc = "Generate Comment (function)",
                silent = true,
            },
            {
                "<leader>cgF",
                function()
                    require("neogen").generate { type = "file" }
                end,
                desc = "Generate Comment (file)",
                silent = true,
            },
            {
                "<leader>cgc",
                function()
                    require("neogen").generate { type = "class" }
                end,
                desc = "Generate Comment (class)",
                silent = true,
            },
            {
                "<leader>cgt",
                function()
                    require("neogen").generate { type = "type" }
                end,
                desc = "Generate Comment (type)",
                silent = true,
            },
        },
        opts = { snippet_engine = "luasnip" },
    },

    -- auto completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-emoji",
            "saadparwaiz1/cmp_luasnip",
            "rcarriga/cmp-dap",
        },
        event = "InsertEnter",
        config = function(_, opts)
            local cmp = require("cmp")
            cmp.setup(opts)
            cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                sources = {
                    { name = "dap" },
                },
            })
        end,
        opts = function()
            local cmp = require("cmp")
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "emoji" },
                },
                formatting = {
                    format = function(_, item)
                        local icons = require("config.icons").kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end
                        return item
                    end,
                },
                experimental = {
                    ghost_text = {
                        hl_group = "LspCodeLens",
                    },
                },
                enabled = function()
                    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                        or require("cmp_dap").is_dap_buffer()
                end,
            }
        end,
    },

    -- auto pairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            require("cmp").event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )
        end,
    },

    -- surround
    {
        "echasnovski/mini.surround",
        keys = { { "gz", desc = "Surround" } },
        config = function(_, opts)
            -- use gz mappings instead of s to prevent conflict with leap
            require("mini.surround").setup(opts)
        end,
        opts = {
            mappings = {
                add = "gza", -- Add surrounding in Normal and Visual modes
                delete = "gzd", -- Delete surrounding
                find = "gzf", -- Find surrounding (to the right)
                find_left = "gzF", -- Find surrounding (to the left)
                highlight = "gzh", -- Highlight surrounding
                replace = "gzr", -- Replace surrounding
                update_n_lines = "gzn", -- Update `n_lines`
            },
        },
    },

    -- comments
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                opleader = {
                    line = "gC",
                    block = "gB",
                },
                pre_hook = require(
                    "ts_context_commentstring.integrations.comment_nvim"
                ).create_pre_hook(),
            }
        end,
    },

    -- Text Objects
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "echasnovski/mini.ai",
        keys = {
            { "a", mode = { "x", "o" } },
            { "i", mode = { "x", "o" } },
        },
        config = function(_, opts)
            local ai = require("mini.ai")
            ai.setup(opts)
        end,
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = {
                            "@block.outer",
                            "@conditional.outer",
                            "@loop.outer",
                        },
                        i = {
                            "@block.inner",
                            "@conditional.inner",
                            "@loop.inner",
                        },
                    }, {}),
                    f = ai.gen_spec.treesitter(
                        { a = "@function.outer", i = "@function.inner" },
                        {}
                    ),
                    c = ai.gen_spec.treesitter(
                        { a = "@class.outer", i = "@class.inner" },
                        {}
                    ),
                },
            }
        end,
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
        opts = function()
            local icons = require("config.icons").kinds
            return {
                position = "left",
                symbols = {
                    Array = { icon = icons.Array },
                    Boolean = { icon = icons.Boolean },
                    Class = { icon = icons.Class },
                    Constant = { icon = icons.Constant },
                    Constructor = { icon = icons.Constructor },
                    Enum = { icon = icons.Enum },
                    EnumMember = { icon = icons.EnumMember },
                    Event = { icon = icons.Event },
                    Field = { icon = icons.Field },
                    File = { icon = icons.File },
                    Function = { icon = icons.Function },
                    Interface = { icon = icons.Interface },
                    Key = { icon = icons.Key },
                    Method = { icon = icons.Method },
                    Module = { icon = icons.Module },
                    Namespace = { icon = icons.Namespace },
                    Null = { icon = icons.Null },
                    Number = { icon = icons.Number },
                    Object = { icon = icons.Object },
                    Operator = { icon = icons.Operator },
                    Package = { icon = icons.Package },
                    Property = { icon = icons.Property },
                    String = { icon = icons.String },
                    Struct = { icon = icons.Struct },
                    TypeParameter = { icon = icons.TypeParameter },
                    Variable = { icon = icons.Variable },
                },
            }
        end,
    },
}
