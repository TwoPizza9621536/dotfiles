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

    -- Color Picker
    { "uga-rosa/ccc.nvim", cmd = { "CccPick", "CccConvert" } },

    -- Hide code
    { "folke/twilight.nvim", cmd = "Twilight" },

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
}
