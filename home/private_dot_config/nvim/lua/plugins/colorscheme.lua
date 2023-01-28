return {
    -- colorschemes
    { "Mofiqul/vscode.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = function()
                require("vscode").setup {
                    italic_comments = true,
                    transparent = true,
                }
                vim.cmd("highlight BufferLineFill guibg=NONE")
            end,
        },
    },

    { "baskerville/bubblegum", event = "VeryLazy" },
    { "doki-theme/doki-theme-vim", event = "VeryLazy" },
    { "tanvirtin/monokai.nvim", event = "VeryLazy" },
}
