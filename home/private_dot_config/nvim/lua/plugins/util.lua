-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- measure startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },

    -- Highlight colors
    {
        "NvChad/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        opts = {
            css = true,
            RRGGBBAA = true,
            sass = {
                enable = true,
            },
        },
    },

    -- Color Picker
    { "uga-rosa/ccc.nvim", cmd = { "CccPick", "CccConvert" } },

    -- Hide code
    {
        "folke/twilight.nvim",
        cmd = "Twilight",
        keys = {
            "<leader>ut",
            "<cmd>Twilight<cr>",
            desc = "Toggle Twilight",
        },
    },

    -- Discord Integration
    { "andweeb/presence.nvim", event = "VeryLazy" },

    -- Unicode
    {
        "chrisbra/unicode.vim",
        cmd = {
            "Digraphs",
            "UnicodeSearch",
            "UnicodeName",
            "UnicodeTable",
            "DownloadUnicode",
            "UnicodeCache",
        },
    },

    -- session management
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            {
                "<leader>qs",
                function()
                    require("persistence").load()
                end,
                desc = "Restore Session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load { last = true }
                end,
                desc = "Restore Last Session",
            },
            {
                "<leader>qd",
                function()
                    require("persistence").stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
        opts = {
            options = {
                "buffers",
                "curdir",
                "tabpages",
                "winsize",
                "help",
            },
        },
    },

    -- library used by other plugins
    "nvim-lua/plenary.nvim",

    -- makes some plugins dot-repeatable like leap
    { "tpope/vim-repeat", event = "VeryLazy" },
}
