return {
    -- Comments
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

    {
        "danymat/neogen",
        cmd = "Neogen",
        keys = {
            {
                "<leader>nf",
                function()
                    require("neogen").generate { type = "func" }
                end,
                desc = "Generate Comment (function)",
                silent = true,
            },
            {
                "<leader>nF",
                function()
                    require("neogen").generate { type = "file" }
                end,
                desc = "Generate Comment (file)",
                silent = true,
            },
            {
                "<leader>nc",
                function()
                    require("neogen").generate { type = "class" }
                end,
                desc = "Generate Comment (class)",
                silent = true,
            },
            {
                "<leader>nt",
                function()
                    require("neogen").generate { type = "type" }
                end,
                desc = "Generate Comment (type)",
                silent = true,
            },
        },
        opts = { snippet_engine = "luasnip" },
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

    -- Markdown
    {
        "antonk52/markdowny.nvim",
        ft = 'markdown',
        opts = {}
    },

    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "kevinhwang91/nvim-hlslens",
            keys = {
                {
                    "n",
                    function()
                        vim.cmd([[execute('normal! ' . v:count1 . 'n')]])
                        require("hlslens").start()
                    end,
                    desc = "Jump to Next Matching Word",
                },
                {
                    "N",
                    function()
                        vim.cmd([[execute('normal! ' . v:count1 . 'N')]])
                        require("hlslens").start()
                    end,
                    desc = "Jump to Previous Matching Word",
                },
                {
                    "*",
                    [[*<cmd>lua require('hlslens').start()<cr>]],
                    desc = "Find Next Matching Word",
                },
                {
                    "#",
                    [[#<cmd>lua require('hlslens').start()<cr>]],
                    desc = "Find Previous Matching Word",
                },
                {
                    "n",
                    "g*",
                    [[g*<cmd>lua require('hlslens').start()<cr>]],
                    { desc = "Find Next Whole Word" },
                },
                {
                    "g#",
                    [[g#<cmd>lua require('hlslens').start()<cr>]],
                    desc = "Find Previous Whole Word",
                },
            },
        },
        event = "BufReadPost",
        config = function(_, opts)
            require("scrollbar").setup(opts)
            require("scrollbar.handlers.search").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
        opts = { handle = { color = "#808080" } },
    },

    -- Sign column
    -- {
    --     "luukvbaal/statuscol.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         setopt = true,
    --     },
    -- },
}
