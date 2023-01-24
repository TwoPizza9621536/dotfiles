return {
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

    -- Add node actions
    {
        "ckolkey/ts-node-action",
        dependencies = "nvim-treesitter/nvim-treesitter",
        keys = {
            {
                "<leader>cA",
                "TSNodeAction",
                desc = "Node Action",
            },
        },
        opts = {},
    },

    -- Hex Editor
    {
        "RaafatTurki/hex.nvim",
        cmd = { "HexToggle" },
        opts = {},
    },

    -- Pasting Images
    {
        "ekickx/clipboard-image.nvim",
        cmd = "PasteImg",
    },

    -- Color Picker
    { "uga-rosa/ccc.nvim", cmd = { "CccPick", "CccConvert" } },

    -- Hide code
    { "folke/twilight.nvim", cmd = "Twilight" },

    -- Discord Integration
    { "andweeb/presence.nvim", event = "VeryLazy" },

    -- Unicode
    { "chrisbra/unicode.vim", cmd = { "UnicodeName", "UnicodeTable" } },
}
